const axios = require('axios');
let X_RapidAPI_Key = `277e330438msh4a3341f50b31789p16c2c1jsna81479b4150e`;
let X_RapidAPI_Host = `mailcheck.p.rapidapi.com`;
let url = `https://mailcheck.p.rapidapi.com/`;

const validatorEmail = async (req,res,email) =>{
    let config = {
        headers: {
            'X-RapidAPI-Key':X_RapidAPI_Key,
            'X-RapidAPI-Host':X_RapidAPI_Host,
        }
    }
    // req.setHeader('X-RapidAPI-Key', X_RapidAPI_Key);
    // req.setHeader('X-RapidAPI-Host', X_RapidAPI_Host);

    let valid = await axios.get(url+"?domain="+email,config);

    if(valid.data.reason != 'Whitelisted'){
        const Data = {
            status: 400,
            reason: valid.data.reason
        }

        return Data;
    }

    const Data={
        status: 200,
    }
    return Data;
}

module.exports={
    validatorEmail
}