const mysql = require('mysql');
const db = require('../Database');
const auth = require('../autentikasi');
const makeUser = async (nama,email,password,telepon,sex,tipe_user,foto_user) =>{
    let signature = 'PE';

    let space = nama.toString().search(' ')
    let inital_nama = space != -1 ? 
    nama.toString().subString(0,2) : nama.toString().subString(0,1) 
    + nama.toString().subString(space+1,1);


    let newKode = signature + '_' +inital_nama.toString().toUpperCase();
    let kode = await db.idMax('kode','mh_pelanggan',`WHERE kode LIKE '${newKode}%'`);
    newKode += kode;

    let api_key = auth.genAPIKey(15);
    let saldo = 0;
    let api_hit = 100;
    let query = 'INSERT INTO mh_pelanggan VALUES(?,?,?,?,?,?,?,?,?,?)';
    await db.executeQueryWithParam(query,[newKode,nama,email,password,telepon,sex,api_hit,api_key,saldo,tipe_user]);

    const Data = {
        status: 201,
        msg: 'berhasil buat user baru',
        data:{
            kode: newKode,
            "api key":api_key,
            "jumlah api hit": api_hit,
            nama,email,password,telepon,
            "jenis kelamin": sex,
            saldo: saldo
        }
    }

    return Data;
}
module.exports = {
    makeUser
}