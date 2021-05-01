const jwt = require("jsonwebtoken");
const User = require("./Models/Users");

const generateToken = (user)=>{
    delete user.password;
    const token = jwt.sign({
        data: user,
    },'projectSOA');

    return token;
}

const verifyToken = (req, res)=>{
    const token = req.header("x-auth-token");
    let user = {};
    if(!token){
        return user;
    }
    try{
        user = jwt.verify(token,"projectSOA");
    }catch(err){
        //401 not authorized
        return user;
    }



    return user;
}
// check akun Free atau tidak
const verifyFree =(req,res)=>{
    let user= verifyToken(req,res);
    if(user.tipe_user=="0"){
        next();
    }
    return res.status(401).send("Akun anda tidak memiliki hak akses");
}
// check akun Advance atau tidak
const verifyAdvanced =(req,res)=>{
    let user= verifyToken(req,res);
    if(user.tipe_user=="1"){
        next();
    }
    return res.status(401).send("Akun anda tidak memiliki hak akses");
}
// check akun Profesional atau tidak
const verifyProfesional =(req,res)=>{
    let user= verifyToken(req,res);
    if(user.tipe_user=="2"){
        next();
    }
    return res.status(401).send("Akun anda tidak memiliki hak akses");
}
// check akun Profesional atau Advance
const verifyNotFree =(req,res)=>{
    let user= verifyToken(req,res);
    if(user.tipe_user!="0"){
        next();
    }
    return res.status(401).send("Akun anda tidak memiliki hak akses");
}

function cekAllNumeric(inputtxt) 
{
    var numbers = /^[-+]?[0-9]+$/;
    if(inputtxt.match(numbers))
    {
        return true;
    }
    else
    {
        return false;
    }
}


const genAPIKey = (length) => {
    const alphabets= 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNPQRSTUVWXYZ'.split('');
    let key= '';

    for (let i= 0; i<length; i++) {
        let hash= Math.floor(Math.random()*2)+1;
        let model= Math.floor(Math.random()*2)+1;
        let randAlpha= Math.floor(Math.random()*alphabets.length);
        
        if (hash === 1) {
            key+= Math.floor(Math.random()*length);
        } else {
            if (model === 1) key+= alphabets[randAlpha].toUpperCase();
            else key+= alphabets[randAlpha]; 
        }
    }

    return key;
};

module.exports = {
    generateToken,
    verifyToken,
    genAPIKey,
    verifyFree,
    verifyAdvanced,
    verifyProfesional,
    verifyNotFree,
    cekAllNumeric
}