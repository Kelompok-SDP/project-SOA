const express = require("express");
const router = express.Router();
const uploadFile = require("../uploadFile");
const Produk = require("../Models/Products");
const auth = require('../autentikasi');

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

router.get('/', async(req, res) =>{
    let user = await auth.verifyToken(req,res);
    if(user.data.email != 'admin'){
        let nama = req.query.nama;
        let desk = req.query.deskripsi;
        let limit = req.query.limit;
        let type = user.data.tipe_user;
        let searchProd = await Produk.searchProductWithLimit(nama, desk, limit, type);
        if(searchProd?.data){
            return res.status(searchProd.status).send({
                Message: searchProd.msg,
                data: searchProd.data     
            });
        }
        return res.status(searchProd.status).send({
            Message: searchProd.msg,
        });
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