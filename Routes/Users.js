const express = require("express");
const router = express.Router();
const uploadFile = require("../uploadFile");
const User = require("../Models/Users");
const auth = require('../autentikasi');
const emailValidator = require("../emailValidator");

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