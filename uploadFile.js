const multer = require("multer");
const db = require("./Database");

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
    }
});

module.exports ={
    storage,
    upload,
    checkFileType
}