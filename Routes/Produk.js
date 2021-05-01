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

router.get("/produsen/:id", async (req,res)=>{
    let getData = await Produk.getProdusen("","");
    return res.send(getData);
})
router.get("/:id", async (req,res)=>{
    let user=await getUser(req,res);
    if(user.data.api_hit<1){
        return res.status(400).send("Api hit user habis");
    }

    let getData = await Produk.getProdukById(req.params.id);
    
    let updatedUser = await User.updateUser(`set api_hit=api_hit-1`,`where email='${user.data.email}'`);
    
    return res.send(getData);
})

module.exports = router;