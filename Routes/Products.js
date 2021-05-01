const express = require("express");
const router = express.Router();
const uploadFile = require("../uploadFile");
const Produk = require("../Models/Products");
const User = require("../Models/Users");
const auth = require('../autentikasi');

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
        return res.status(apihit.status).send({
            Message: apihit.msg,
        });
    }
    let id = req.params.id;
    let getData = await Produk.getProdusen(2,0,"",id,"");
    return res.status(200).send(getData);
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

    let getData = await Produk.getProdusen(1,limit,kota,"",nama);
     return res.status(200).send(getData);
})


const vertifikasiAdmin = async (req, res) => {
    let user = await auth.verifyToken(req,res);
    //token kosong
    if(!user?.data?.email){
        return res.status(401).send({
            error: 'Unauthorized'
        })
    }

    if(user?.data?.email != 'admin'){
        return res.status(401).send({
            error: 'Unauthorized hanya boleh admin'
        })
    }
}

router.get('/', async(req, res) =>{ //iso pake jwt iso apikey, walaupun admin mb user
    let users = null;
    let apihit = 0;
    if(!req.header){
        return res.status(401).send({"Message": "Unauthorized"});
    }
    const token = req.header("x-auth-token");
    if(token.length > 15){
        users = await auth.verifyToken(req,res);
        if(users.data.email != 'admin'){
            return res.status(400).send({
                error: 'Token invalid'
            })
        }
    }else{
        users = await User.getUserFromAPiKey(token);
        apihit = await User.decreaseApihit(users.api_key);
    }
    if(apihit > 0){
        let nama = req.query.nama;
        let desk = req.query.deskripsi;
        let limit = req.query.limit;
        let type = users.tipe_user;
        let searchProd = await Produk.searchProductWithLimit(nama, desk, limit, type, apihit);
        if(searchProd?.data){
            return res.status(searchProd.status).send({
                Message: searchProd.msg,
                data: searchProd.data     
            });
        }
        return res.status(searchProd.status).send({
            Message: searchProd.msg,
        });
    }else{
        return res.status(400).send({Message: "Api Hit tidak mencukupi"});
    }
});

router.post('/', async (req, res) =>{
    let verify = await vertifikasiAdmin(req, res);
    if(!verify){
        let nama = req.body.nama;
        let kat = req.body.id_kategori;
        let produsen = req.body.id_produsen;
        let satuan = req.body.satuan;
        let indik = req.body.indikasi;
        let kompos = req.body.komposisi;
        let dosis = req.body.dosis;
        let aturan = req.body.aturan_pakai;
        let kemasan = req.body.kemasan;
        let harga = req.body.harga;
        let resep = req.body.butuh_resep;
        let keterangan = req.body.keterangan;
        let insertProd = await Produk.addProduct(nama,kat,produsen,satuan,indik,kompos,dosis,aturan,kemasan,harga,resep,keterangan);
        if(insertProd?.data){

            return res.status(insertProd.status).send({
                Message: insertProd.msg,
                data: insertProd.data     
            });
        }
        return res.status(insertProd.status).send({
            Message: insertProd.msg,

        });
    }
});

router.put('/', async (req, res) =>{
    let verify = await vertifikasiAdmin(req, res);
    if(!verify){
        let id = req.body.id_produk;
        let produsen = req.body.id_produsen;
        let harga = req.body.harga;
        let kemasan = req.body.kemasan;
        let keterangan = req.body.keterangan;
        let updateProd = await Produk.updProduct(id,produsen,harga,kemasan,keterangan);
        if(updateProd?.data){
            return res.status(updateProd.status).send({
                Message: updateProd.msg,
                data: updateProd.data     
            });
        }
        return res.status(updateProd.status).send({
            Message: updateProd.msg,

        });
    }
});

router.delete('/', async (req, res) =>{
    let verify = await vertifikasiAdmin(req, res);
    if(!verify){
        let id = req.body.id_produk;

        let deleteProd = await Produk.delProduct(id);
        if(deleteProd?.data){
            return res.status(deleteProd.status).send({
                Message: deleteProd.msg,
                data: deleteProd.data     
            });
        }
        return res.status(deleteProd.status).send({
            Message: deleteProd.msg,

        });
    }
});
module.exports = router;