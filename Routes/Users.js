const express = require("express");
const router = express.Router();
const User = require("../Models/Users");
const Upload = require("../uploadFile");
const Produk = require("../Models/Products");
const auth = require('../autentikasi');
const emailValidator = require("../emailValidator");

const db = require('../Database');

async function getUser(req,res){
    let user = auth.verifyToken(req,res);
  console.log(user);
    user.data = await User.getAllUser(`where email='${user.data.email}' AND tipe_user != 4`,0);
    console.log("Get User : "+user.data);
    user.data=user.data[0];
    return user;
}

// const fs = require("fs");
// const multer = require("multer");
// const OAuth2Data = require("../credentials.json");
// var name,pic

// const { google } = require("googleapis");

// const CLIENT_ID = OAuth2Data.web.client_id;
// const CLIENT_SECRET = OAuth2Data.web.client_secret;
// const REDIRECT_URL = OAuth2Data.web.redirect_uris[0];

// const oAuth2Client = new google.auth.OAuth2(
//   CLIENT_ID,
//   CLIENT_SECRET,
//   REDIRECT_URL
// );
// var authed = false;

// // If modifying these scopes, delete token.json.
// const SCOPES =
//   "https://www.googleapis.com/auth/drive.file https://www.googleapis.com/auth/userinfo.profile";

// var Storage = multer.diskStorage({
//   destination: function (req, file, callback) {
//     callback(null, "./Public/Uploads");
//   },
//   filename: function (req, file, callback) {
//     callback(null, file.fieldname + "_" + Date.now() + "_" + file.originalname);
//   },
// });

// var uploadss = multer({
//   storage: Storage,
// }).single("foto_user"); //Field name and max count

// var upload = multer({
//     storage: Storage,
// }) //Field name and max count

// function get() {
//     if (!authed) {
//         // Generate an OAuth URL and redirect there
//         var url = oAuth2Client.generateAuthUrl({
//           access_type: "offline",
//           scope: SCOPES,
//         });
//         console.log(url);
//       } else {
//         var oauth2 = google.oauth2({
//           auth: oAuth2Client,
//           version: "v2",
//         });
//         oauth2.userinfo.get(function (err, response) {
//           if (err) {
//             console.log(err);
//           } else {
//             console.log(response.data);
//             name = response.data.name
//             pic = response.data.picture
//           }
//         });
//       }
// }


router.post('/register', Upload.upload.single("foto_user"), async (req, res) => {
    //let nama_file = null;
    let {nama, email,password,telepon,jenis_kelamin} = req.body;
    console.log(nama);  
    let foto_user = "./public/uploads/"+req.file.filename;
    //get();
    // uploadss(req, res, function (err) {
    //     if (err) {
    //       console.log(err);
    //       return res.end("Something went wrong");
    //     } else {
    //       nama_file = req.file.filename;
    //       console.log("asas: "+req.file.path);
    //       const drive = google.drive({ version: "v3",auth:oAuth2Client  });
    //       const fileMetadata = {
    //         name: req.file.filename,
    //         parents:['https://drive.google.com/drive/u/3/folders/1gNCbR98LDc6Mitxk4fB4Hz5mFBuCWfs0']
    //       };
    //       console.log(oAuth2Client);
    //       const media = {
    //         mimeType: req.file.mimetype,
    //         body: fs.createReadStream(req.file.path),
    //       };
    //       drive.files.create(
    //         {
    //           resource: fileMetadata,
    //           media: media,
    //           fields: "id",
    //         },
    //         (err, file) => {
    //           if (err) {
    //             // Handle error
    //             console.error(err);
    //           } else {
    //             fs.unlinkSync(req.file.path)
    //           }
    //         }
    //       );
    //     }
    //   });

    nama = nama.toString().charAt(0).toUpperCase()+nama.toString().slice(1);
    let tipe_user = 0;
    let validEmail = await emailValidator.validatorEmail(req,res,email);
    if(validEmail.status == 400){
        return res.status(400).send({
            message:validEmail.reason
        })
    }

    
    let query = `SELECT * FROM mh_pelanggan WHERE email = '${email}'`;
    let user = await db.executeQuery(query);

    if(user.length > 0){
        return res.status(400).send({
            message:'email sudah pernah digunakan'
        })
    }

    query = `SELECT * FROM mh_pelanggan WHERE telepon = '${telepon}'`;
    user = await db.executeQuery(query);

    if(user.length > 0){
        return res.status(400).send({
            message:'no telepon sudah pernah digunakan'
        })
    }

    let newUser = await User.makeUser(nama,email,password,telepon,jenis_kelamin,tipe_user,foto_user);

    if(newUser.data){
        return res.status(newUser.status).send({
            Message: newUser.msg,
            data: newUser.data     
        });
    }
    //kalo error
    return res.status(newUser.status).send({
        Message: newUser.msg,

    });

});

router.post('/login',async (req, res) => {
    let {email, password} = req.body;
    if(email == 'admin' && password == 'admin'){
        const user = {
            email,password
        }
        let token = await auth.generateToken(user);
        return res.status(200).send({
            email,
            token
        })
    }
    console.log(req.body.email);
    let user = await User.userLogin(email,password);
    if(user.status == 404){
        return res.status(user.status).send({
            error: user.msg
        })
    }
    return res.status(user.status).send(user.data);
})

//admin user

const vertifikasiAdmin = async (req, res) => {
    let user = await auth.verifyToken(req,res);
    //token kosong
    if(!user.data.email){
        return {
            status:401,
            msg: 'Unauthorized'
        };
    }
    //cek kalau user biasa
    if(user.data.email != 'admin'){
        return {
            status:401,
            msg: 'Unauthorized hanya boleh admin'
        };
    }
    return user;
    
}

router.get('/',async (req, res) => {
    let data = await vertifikasiAdmin(req,res);
  console.log(data);
    if(data.status == 401){
        return res.status(401).send({"Message": data.msg});
    }

    let where = req.query.email != null ? `WHERE email = '${req.query.email}'` : "";
    let limit = req.query.limit != null ? `LIMIT  ${req.query.limit}` : "";
    // console.log(req.query);
    let users = await User.getAllUser(where,limit);
    return res.status(200).send(users);
});

router.get('/profil',async (req, res) => {
    let user = auth.verifyToken(req,res);
    
    delete user.data.password;
    delete user.data.kode;

    user.data.jeniskelamin = user.data.jeniskelamin=="P"?"Perempuan":"Laki Laki";
    let tipe_user = ["Free","Advance","Profesional"];
    user.data.tipe_user=tipe_user[user.data.tipe_user];

    return res.status(200).send(user.data);
});

router.put('/upgrade',async (req, res) => {
    let user=await getUser(req,res)
    let price=[15000,25000];
    //console.log(user.data.saldo, user.data.tipe_user, user.data.email);
    let tipe=req.body.tipe;

    if(tipe > 2){
        return res.status(400).send("Tipe salah input");
    }

    if(user.data.saldo < price[tipe-1]){
        return res.status(400).send("Saldo anda tidak cukup");
    }

    if(user.data.tipe_user >= parseInt(tipe)){
        return res.status(400).send("Tipe anda lebih tinggi atau sama tinggi");
    }
    user.data.saldo = parseInt(user.data.saldo - price[tipe-1]);
    user.data.tipe_user=parseInt(tipe);
    let keterangan = "upgrade User ke tipe-"+parseInt(tipe);
    let updatedUser = await User.updateUser(`set saldo='${user.data.saldo}', tipe_user=${user.data.tipe_user}`,`where email='${user.data.email}'`);
    await User.makeLog(user.data.kode,keterangan,price[tipe-1],"Upgrade");

    return res.status(200).send(user.data);
});


router.put("/recharge", async (req,res)=>{
    let user=await getUser(req,res);
    let api_hit = req.body.api_hit;

    if( !auth.cekAllNumeric(api_hit)){
        return res.status(400).send({"Message": "Format api hit hanya boleh angka"});
    }
    let total= parseInt(api_hit) * 10000;
    if(parseInt(user.data.saldo) < total){
        return res.status(400).send("Saldo anda tidak cukup");
    }
    let update_saldo = parseInt(user.data.saldo) - total;
    let temp= user.data.api_hit
    user.data.api_hit +=parseInt(api_hit);

    let tipe = "Free";
    if(user.data.tipe_user==2){
        tipe = "Profesional"
    }else if(user.data.tipe_user == 1){
        tipe = "Advance"
    }
    let keterangan  = "recharge api Hit sebesar :"+ total
    let updatedUser = await User.updateUser(`set saldo='${update_saldo}', api_hit='${user.data.api_hit}'`,`where email='${user.data.email}'`);
    await User.makeLog(user.data.kode,keterangan,total,"Recharge");

    return res.status(200).send({
        "nama" : user.data.nama,
        "email" : user.data.email,
        "nomor_telepon" : user.data.telepon,
        "jumlah_recharge" : parseInt(api_hit),
        "total_pembayaran" : total,
        "api_hit_sebelumnya" : temp,
        "api_hit_sesudah_recharge" : user.data.api_hit,
        "tipe_user" : tipe
    })

})


router.put('/topup',async (req, res) => {
    let user=await getUser(req,res)
    console.log(user.data);
    let saldo=req.body.saldo;

    user.data.saldo=parseInt(user.data.saldo)+parseInt(saldo)

    let updatedUser = await User.updateUser(`set saldo='${user.data.saldo}'`,`where email='${user.data.email}'`);

    let keterangan = "top up saldo sebesar :" + parseInt(saldo);
    await User.makeLog(user.data.kode,keterangan,saldo,"TopUp");


    return res.status(200).send(user.data);
});
router.put('/gantiEmail',async (req, res) => {
    let user=await getUser(req,res)
    let email=req.body.email;

    let updatedUser = await User.updateUser(`set email='${email}'`,`where email='${user.data.email}'`);

    return res.status(200).send("Email berhasil di ganti tolong login kembali");
});
router.post('/deskripsi',async (req, res) => {
    let user=await getUser(req,res)
    let {id_produk,isi_deskripsi}=req.body;

    let _Produk = await Produk.getProduk(`where kode = '${id_produk}'`)

    if(_Produk.length==0){
        return res.status(404).send("Produk tidak ditemukan");
    }

    if(!isi_deskripsi||isi_deskripsi==""){
        return res.status(400).send("isi deskripsi kosong");
    }
    await Produk.addDeskripsi(`values(0,'${isi_deskripsi}','${user.data.kode}','${id_produk}','0')`);


    return res.status(201).send("berhasil menambahkan deskripsi");
});


router.delete('/',async (req, res) => {
    let data = await vertifikasiAdmin(req,res);
    if(data.status == 401){
        return res.status(401).send({"Message": data.msg});
    }
    let email = req.body.email;

    if(!email){
        return res.status(400).send({"Message": "Mohon isi email user"});
    }

    let query = `SELECT * FROM mh_pelanggan WHERE email = '${email}' AND tipe_user != '4'`;
    let user = await db.executeQuery(query);

    if(user.length == 0){
        return res.status(404).send({"Message": "user tidak ditemukan"});
    }

    let deletedUser = await User.deleteUser(email);
    return res.status(200).send(deletedUser);
});

router.get('/log', async (req, res) =>{
    let data = await vertifikasiAdmin(req,res);
    if(data.status == 401){
        return res.status(401).send({"Message": data.msg});
    }
    let where = "";
    let limit = req.query.limit == null ? "" : `LIMIT ${req.query.limit}`;
    let users = [];
    if(req.query.nama || req.query.tanggal){
        if(req.query.nama){
            let nama = req.query.nama;
            let query = `SELECT * FROM mh_pelanggan WHERE nama LIKE '${nama}%'`;
            users = await db.executeQuery(query);
        }

        if(req.query.tanggal){
            where = "WHERE ";
            let tanggal = req.query.tanggal;
            where += `tgl_transaksi = '${tanggal}'`;
        }
        
    }
    console.log("log: "+where, limit, users);
    let logs = await User.getLogAllUser(where,limit,users);
    return res.status(200).send(logs);
})

//===== SHAN
router.get('/:id_user', async (req, res) =>{
    
    let verify = await vertifikasiAdmin(req, res);
    if(verify){
        let userId = req.params.id_user;
        let searchUser = await User.getUser(userId);
        if(searchUser.data){
            return res.status(searchUser.status).send({
                Message: searchUser.msg,
                data: searchUser.data     
            });
        }
        return res.status(searchUser.status).send({
            Message: searchUser.msg,

        });
    }else{
      console.log("test");
    }
});

module.exports = router;