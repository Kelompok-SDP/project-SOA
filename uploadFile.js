const multer = require("multer");
const db = require("./Database");
const fs= require("fs");
const readline = require('readline');
const {google} = require('googleapis');

const storage=multer.diskStorage({
    destination:function(req,file,callback){
        callback(null,'./public/uploads');
    },
    filename:async function(req,file,callback){
        const extension = file.originalname.split('.')[file.originalname.split('.').length-1];

        let nama = req.body.nama;
        let signature = 'PE';

        let space = nama.toString().search(' ');
        let inital_nama = space != -1 ? 
        nama.toString().substring(0,2) : nama.toString().substring(0,1) 
        + nama.toString().substring(space+1,1);


        let newKode = signature + '_' +inital_nama.toString().toUpperCase();
        let kode = await db.idMax('kode','mh_pelanggan',`WHERE kode LIKE '${newKode}%'`);
        newKode += kode;


        const filename = 'Profil_'+newKode;
        callback(null,(filename+'.'+extension));
    }
});


const storageAddPro=multer.diskStorage({
    destination:function(req,file,callback){
        callback(null,'./public/uploads');
    },
    filename:async function(req,file,callback){
        const extension = file.originalname.split('.')[file.originalname.split('.').length-1];

        let nama = req.body.nama;
        let signature = 'PR';

        let space = nama.toString().search(' ');
        let inital_nama = space != -1 ? 
        nama.toString().substring(0,2) : nama.toString().substring(0,1) 
        + nama.toString().substring(space+1,1);


        let newKode = signature + '_' +inital_nama.toString().toUpperCase();
        let kode = await db.idMax('kode','mh_produk',`WHERE kode LIKE '${newKode}%'`);
        newKode += kode;


        const filename = 'Product_'+newKode;
        callback(null,(filename+'.'+extension));
    }
});

const storageUpdPro=multer.diskStorage({
    destination:function(req,file,callback){
        callback(null,'./public/uploads');
    },
    filename:async function(req,file,callback){
        const extension = file.originalname.split('.')[file.originalname.split('.').length-1];

        let id = req.body.id_produk;
        let select =  `SELECT * FROM MH_PRODUK WHERE KODE = '${id}'`;
        await db.executeQuery(select);
        
        const filename = 'Product_'+id;
        callback(null,(filename+'.'+extension));
    }
});

function checkFileType(file,cb){
    const filetypes= /jpeg|jpg|png|gif/;
    const extname=filetypes.test(file.originalname.split('.')[file.originalname.split('.').length-1]);
    const mimetype=filetypes.test(file.mimetype);
    
    if(mimetype && extname){
        return cb(null,true);
    }else{
        cb(error = 'Error : Image Only!');
    }
}


const upload=multer({
    storage:storage,
    fileFilter: function(req,file,cb){
        checkFileType(file,cb);
    },
});

const uploadAddPro=multer({
    storage:storageAddPro,
    fileFilter: function(req,file,cb){
        checkFileType(file,cb);
    },
});

const uploadUpdPro=multer({
    storage:storageUpdPro,
    fileFilter: function(req,file,cb){
        checkFileType(file,cb);
    },
});

const SCOPES = ['https://www.googleapis.com/auth/drive.file'];
const TOKEN_PATH = 'token.json';

function authorize(credentials, callback) {
    // console.log(credentials);
    const {client_secret, client_id, redirect_uris} = credentials;
    const oAuth2Client = new google.auth.OAuth2(
        client_id, client_secret, redirect_uris[0]);

    // Check if we have previously stored a token.
    fs.readFile(TOKEN_PATH, (err, token) => {
        if (err) return getAccessToken(oAuth2Client, callback);
        oAuth2Client.setCredentials(JSON.parse(token));
        callback(oAuth2Client);
    });
}

function getAccessToken(oAuth2Client, callback) {
    const authUrl = oAuth2Client.generateAuthUrl({
        access_type: 'offline',
        scope: SCOPES,
    });
    console.log('Authorize this app by visiting this url:', authUrl);
    const rl = readline.createInterface({
        input: process.stdin,
        output: process.stdout,
    });
    // rl.question('Enter the code from that page here: ', (code) => {
    //     rl.close();
    //     oAuth2Client.getToken(code, (err, token) => {
    //         if (err) return console.error('Error retrieving access token', err);
    //         oAuth2Client.setCredentials(token);
    //         // Store the token to disk for later program executions
    //         fs.writeFile(TOKEN_PATH, JSON.stringify(token), (err) => {
    //             if (err) return console.error(err);
    //             console.log('Token stored to', TOKEN_PATH);
    //         });
    //         callback(oAuth2Client);
    //     });
    // });
}

function uploadFile(auth) {
    const drive = google.drive({version: 'v3', auth});
    const fileMetadata = {
        'name': filenameBaru,
        parents:['https://drive.google.com/drive/u/3/folders/1gNCbR98LDc6Mitxk4fB4Hz5mFBuCWfs0']
    };
    const media = {
        mimeType: 'image/jpeg',
        body: fs.createReadStream(fullPath)
    };
    drive.files.create({
        resource: fileMetadata,
        media: media,
        fields: 'id'
    }, (err, file) => {
        if (err) {
        // Handle error
        console.error(err);
        } else {
        console.log('File Id: ', file.id);
        }
    });
    }

    fs.readFile('credentials.json', (err, content) => {
    if (err) return console.log('Error loading client secret file:', err);
    // Authorize a client with credentials, then call the Google Drive API.
    authorize(JSON.parse(content), uploadFile);
    });

module.exports ={
    storage,
    storageAddPro,
    storageUpdPro,
    upload,
    uploadAddPro,
    uploadUpdPro,
    checkFileType
}