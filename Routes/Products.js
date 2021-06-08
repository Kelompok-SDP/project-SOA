const express = require("express");
const router = express.Router();
const uploadFile = require("../uploadFile");
const Produk = require("../Models/Products");
const User = require("../Models/Users");
const auth = require('../autentikasi');


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
    if(users == "User telah di-banned"){
        return res.status(401).send({
            error: 'User telah di-banned'
        })
    }
    //cek apakah ada user atau tidak
    if(!users){
        return res.status(401).send({"Message": "Unauthorized"});
    }
    //kalo bukan profession maka ditendang
    if(users.tipe_user < 2){
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
    if(users == "User telah di-banned"){
        return res.status(401).send({
            error: 'User telah di-banned'
        })
    }
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
    if(token.length > 18){
        users = await auth.verifyToken(req,res);
        console.log(users);
        if(users.data.email != 'admin'){
            return res.status(400).send({
                error: 'Token invalid'
            })
        }
    }else{
        users = await User.getUserFromAPiKey(token);
        if(users == "User telah di-banned"){
            return res.status(401).send({
                error: 'User telah di-banned'
            })
        }
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

router.post('/', uploadFile.uploadAddPro.single("foto_produk"), async (req, res) =>{
    let verify = await vertifikasiAdmin(req, res);
    if(!verify){
        if(req.file){
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
            let foto_produk = "./Public/uploads/"+req.file.filename;
            let insertProd = await Produk.addProduct(nama,kat,produsen,satuan,indik,kompos,dosis,aturan,kemasan,harga,resep,keterangan,foto_produk);
            if(insertProd?.data){
                return res.status(insertProd.status).send({
                    Message: insertProd.msg,
                    data: insertProd.data     
                });
            }
        }else{
            return res.status(400).send({
                Message: "Foto tidak ditemukan, harap upload foto"
            });
        }
        return res.status(insertProd.status).send({
            Message: insertProd.msg,

        });
    }
});

router.put('/', uploadFile.uploadUpdPro.single("foto_produk"), async (req, res) =>{
    let verify = await vertifikasiAdmin(req, res);
    if(!verify){
        let id = req.body.id_produk;
        let produsen = req.body.id_produsen;
        let harga = req.body.harga;
        let kemasan = req.body.kemasan;
        let keterangan = req.body.keterangan;
        let updateProd = null;
        let foto_produk = "";
        if(req.file){
            foto_produk = "./Public/uploads/"+req.file.filename;
            updateProd = await Produk.updProduct(id,produsen,harga,kemasan,keterangan,foto_produk);
        }else{
            updateProd = await Produk.updProduct(id,produsen,harga,kemasan,keterangan,foto_produk);
        }
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

router.get('/deskripsi', async (req, res) =>{
    let verify = await vertifikasiAdmin(req, res);
    if(!verify){
        let selectPorduct = await Produk.getProdukNewDeskripsi();
        return res.status(200).send(selectPorduct);
    }
});

router.put('/produkDeskripsi/:id', async (req, res) =>{
    let verify = await vertifikasiAdmin(req, res);
    if(!verify){
        let selectPorduct = await Produk.UpdateProdukNewDeskripsi(req.params.id);
        console.log()
        return res.status(selectPorduct.status).send(
            selectPorduct.data
        );
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

router.get("/kategori", async function (req,res){
    //cek apakah ada token
    if(!req.header){
        return res.status(401).send({"Message": "Unauthorized"});
    }
    const token = req.header("x-auth-token");

    let users = null;
    users = await User.getUserFromAPiKey(token);
    if(users == "User telah di-banned"){
        return res.status(401).send({
            error: 'User telah di-banned'
        })
    }
    //cek apakah ada user atau tidak
    if(!users){
        return res.status(401).send({"Message": "Unauthorized"});
    }
    //kalo bukan profession maka ditendang
    if(users.tipe_user == 0){
        return res.status(401).send({"Message": "Unauthorized"});
    }
    //cek api hit apakah cukup atau tidak 
    let apihit = await User.decreaseApihit(token);
    
    if(apihit ==0 ){
        return res.status(200).send({"Message": "Api Hit tidak mencukupi"});
    }



    let nama = "";
    let deskripsi = "";
    let limit = "";

    

    if(req.query.limit){
        limit = req.query.limit;
        if( !auth.cekAllNumeric(limit)){
            return res.status(400).send({"Message": "Format limit hanya boleh angka"});
        }
    
    }

    if(req.query.deskripsi){
       deskripsi = req.query.deskripsi
    }

    if(req.query.nama){
        nama = req.query.nama;
    }

    let getData = await Produk.getKategoriProduk(limit,nama,deskripsi);
     return res.status(200).send(getData);
})




router.get("/:id", async (req,res)=>{
    const token = req.header("x-auth-token");
    let user = await User.getUserFromAPiKey(token);
        if(user == "User telah di-banned"){
            return res.status(401).send({
                error: 'User telah di-banned'
            })
        }
    if(user.api_hit<1){
        return res.status(400).send("Api hit user habis");
    }

    let getData = await Produk.getProdukById(req.params.id);
    
    let updatedUser = await User.updateUser(`set api_hit=api_hit-1`,`where email='${user.email}'`);
    
    return res.send(getData);
})




module.exports = router;