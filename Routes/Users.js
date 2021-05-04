const express = require("express");
const router = express.Router();
const uploadFile = require("../uploadFile");
const User = require("../Models/Users");
const Produk = require("../Models/Produk");
const auth = require('../autentikasi');
const emailValidator = require("../emailValidator");

async function getUser(req,res){
    let user = auth.verifyToken(req,res);

    user.data = await User.getAllUser(`where email='${user.data.email}'`);
    user.data=user.data[0];
    return user;
}

router.post('/register',uploadFile.upload.single("foto_user"),async (req, res) => {
    let {nama, email,password,telepon,sex,tipe_user} = req.body;
    let foto_user = req.file.filename;

    let validEmail = emailValidator.validatorEmail(email);
    if(validEmail.status == 400){
        return res.status(400).send({
            message:validEmail.reason
        })
    }

    //TODO cek email user sudah dipakai apa belum
    let newUser = await User.makeUser(nama,email,password,telepon,sex,tipe_user,foto_user);

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

    if(user.data == 404){
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
        return res.status(401).send({
            error: 'Unauthorized'
        })
    }
    //cek kalau user biasa
    if(user?.data?.email != 'admin'){
        return res.status(401).send({
            error: 'Unauthorized hanya boleh admin'
        })
    }
}

router.get('/',async (req, res) => {
    await vertifikasiAdmin();

    let where = req.query != "" ? `WHERE email = '${email}'` : "";
    let users = await User.getAllUser(where);
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
    await vertifikasiAdmin();

    let email = req.body.email;
    let deletedUser = await User.deleteUser(email);
});
    
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