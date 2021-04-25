const express = require("express");
const router = express.Router();
const uploadFile = require("../uploadFile");
const User = require("../Models/Users");
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
module.exports = router;