const express = require("express");
const router = express.Router();
const uploadFile = require("../uploadFile");
const User = require("../Models/Users");
const Produk = require("../Models/Products");
const auth = require('../autentikasi');
const emailValidator = require("../emailValidator");

const db = require('../Database');

async function getUser(req,res){
    let user = auth.verifyToken(req,res);

    user.data = await User.getAllUser(`where email='${user.data.email}'`);
    user.data=user.data[0];
    return user;
}

router.post('/register',uploadFile.upload.single("foto_user"),async (req, res) => {
    let {nama, email,password,telepon,jenis_kelamin} = req.body;
    let foto_user = "./Public/uploads/"+req.file.filename;

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

    if(newUser?.data){
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
    if(!user?.data?.email){
        return {
            status:401,
            msg: 'Unauthorized'
        };
    }
    //cek kalau user biasa
    if(user?.data?.email != 'admin'){
        return {
            status:401,
            msg: 'Unauthorized hanya boleh admin'
        };
    }
}

router.get('/',async (req, res) => {
    let data = await vertifikasiAdmin(req,res);
    if(data?.status == 401){
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

    let tipe=req.body.tipe;

    if(tipe<3){
        return res.status(400).send("Tipe salah input");
    }

    if(user.data.saldo < price[tipe-1]){
        return res.status(400).send("Saldo anda tidak cukup");
    }

    if(user.data.tipe_user >= parseInt(tipe)){
        return res.status(400).send("Tipe anda lebih tinggi atau sama tinggi");
    }

    user.data.saldo-=price[tipe];
    user.data.tipe_user=parseInt(tipe)

    let updatedUser = await User.updateUser(`set saldo='${user.data.saldo}', tipe_user='${user.data.tipe_user}'`,`where email='${user.data.email}'`);
    


    return res.status(200).send(user.data);
});
router.put('/topup',async (req, res) => {
    let user=await getUser(req,res)

    let saldo=req.body.saldo;

    user.data.saldo=parseInt(user.data.saldo)+parseInt(saldo)

    let updatedUser = await User.updateUser(`set saldo='${user.data.saldo}'`,`where email='${user.data.email}'`);

    return res.status(200).send(user.data);
});
router.put('/gantiEmail',async (req, res) => {
    let user=await getUser(req,res)

    let email=req.body.email;

    let updatedUser = await User.updateUser(`set email='${user.data.email}'`,`where email='${user.data.email}'`);

    return res.status(200).send("Email berhasil di ganti tolong login kembali");
});
router.post('/addDeskripsi',async (req, res) => {
    let user=await getUser(req,res)

    let {id_produk,isi_deskripsi}=req.body;

    let _Produk = await Produk.getProduk(`where kode = '${id_produk}'`)

    if(_Produk.length==0){
        return res.status(404).send("Produk tidak ditemukan");
    }

    if(!isi_deskripsi||isi_deskripsi==""){
        return res.status(400).send("isi deskripsi kosong");
    }

    await Produk.addDeskripsi(`values('','${isi_deskripsi}','${user.kode}','${id_produk}','0')`);


    return res.status(201).send("berhasil menambahkan deskripsi");
});


router.delete('/',async (req, res) => {
    let data = await vertifikasiAdmin(req,res);
    if(data?.status == 401){
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

    let logs = await User.getLogAllUser(where,limit,users);
    return res.status(200).send(logs);
})

//===== SHAN
router.get('/:id_user', async (req, res) =>{
    let verify = await vertifikasiAdmin(req, res);
    if(!verify){
        let userId = req.params.id_user;
        let searchUser = await User.getUser(userId);
        if(searchUser?.data){
            return res.status(searchUser.status).send({
                Message: searchUser.msg,
                data: searchUser.data     
            });
        }
        return res.status(searchUser.status).send({
            Message: searchUser.msg,

        });
    }
});

module.exports = router;