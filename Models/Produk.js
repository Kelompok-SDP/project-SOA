const db = require('../Database');
const auth = require('../autentikasi');

const getProdusen = async(id,nama)=>{
    let data = db.executeQuery('select * from mh_produsen');
    return data
}

const getProdukById = async(id)=>{
    let data = db.executeQuery(`select kat.nama "Jenis Kategori",sat.nama "Jenis Satuan",pro.nama "Nama Produsen", prod.nama "Nama Produk",prod.indikasi,prod.komposisi,prod.dosis,prod.aturan_pakai,prod.harga,if(prod.butuh_resep=1,'Butuh','Tidak Butuh') "Butuh Resep"
    from mh_produk prod ,mh_kategori kat,mh_produsen pro,mh_satuan sat
    where kat.kode=prod.fk_kategori and 
    pro.kode=prod.fk_produsen and
    sat.kode=prod.fk_satuan and
    prod.kode='${id}'`);
    return data
}

module.exports = {
   getProdusen,
   getProdukById
}