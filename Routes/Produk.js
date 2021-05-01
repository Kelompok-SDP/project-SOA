const express = require("express");
const router = express.Router();
const uploadFile = require("../uploadFile");
const User = require("../Models/Users");
const Produk = require("../Models/Produk");
const User = require("../Models/Users");
const auth = require('../autentikasi');
const emailValidator = require("../emailValidator");

async function getUser(req,res){
    let user = auth.verifyToken(req,res);

    user.data = await User.getAllUser(`where email='${user.data.email}'`);
    user.data=user.data[0];
    return user;
}

router.get("/produsen/:id", async (req,res)=>{
   //cek apakah ada token
    if(!req.header){
        return res.status(401).send({"Message": "Unauthorized"});
    }
    const token = req.header("x-auth-token");

    let users = null;
    users = await User.getUserFromAPiKey(token);
    //cek apakah ada user atau tidak
    if(!users){
        return res.status(401).send({"Message": "Unauthorized"});
    }
    //kalo bukan profession maka ditendang
    if(users.tipe_user != 2){
        return res.status(401).send({"Message": "Unauthorized"});
    }
    //cek api hit apakah cukup atau tidak 
    let apihit = await User.decreaseApihit(token);
    
    if(apihit ==0 ){
        return res.status(200).send({"Message": "Api Hit tidak mencukupi"});
    }
    let id = req.params.id;
    let getData = await Produk.getProdusen(2,0,"",id,"");
    return res.status(200).send(getData);
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



router.get("/produsen", async (req,res)=>{
    //cek apakah ada token
     if(!req.header){
         return res.status(401).send({"Message": "Unauthorized"});
     }
     const token = req.header("x-auth-token");
 
     let users = null;
     users = await User.getUserFromAPiKey(token);
     //cek apakah ada user atau tidak
     if(!users){
         return res.status(401).send({"Message": "Unauthorized"});
     }
     //kalo bukan profession maka ditendang
     if(users.tipe_user != 2){
         return res.status(401).send({"Message": "Unauthorized"});
     }
     //cek api hit apakah cukup atau tidak 
     let apihit = await User.decreaseApihit(token);
     
     if(apihit ==0 ){
         return res.status(200).send({"Message": "Api Hit tidak mencukupi"});
     }
     let nama = "";
     let kota = "";
     let limit = "";

     

     if(req.query.limit){
          limit = req.query.limit;
         if( !auth.cekAllNumeric(limit)){
            return res.status(400).send({"Message": "Format limit hanya boleh angka"});
         }
       
     }

     if(req.query.kota){
        kota = req.query.kota;
     }

     if(req.query.nama){
        nama = req.query.nama;
     }

     let getData = await Produk.getProdusen(1,parseInt(limit),kota,"",nama);
     return res.status(200).send(getData);
 })

module.exports = router;