const express = require("express");
const router = express.Router();
const uploadFile = require("../uploadFile");
const Produk = require("../Models/Produk");
const auth = require('../autentikasi');
const emailValidator = require("../emailValidator");


router.get("/produsen/:id", async (req,res)=>{
    let getData = await Produk.getProdusen("","");
    return res.send(getData);
})

module.exports = router;