const jwt = require("jsonwebtoken");

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
    cekAllNumeric
}