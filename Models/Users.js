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

const userLogin = async (email, password) => {
    let query = `SELECT * FROM mh_pelanggan WHERE email = '${email}' AND password = '${password}'`;
    let user = await db.executeQuery(query);

    if(user.length == 0) {
        const Data = {
            status:404,
            msg: 'user tidak ditemukan'
        }

        return Data;
    }

    let token = await auth.generateToken(user[0]);
    const Data = {
        status:200,
        data:{
            email: user[0].email,
            nama: user[0].nama,
            token
        }
    }

    return Data;
}

const getAllUser = async (where = '') => {
    let query = `SELECT * FROM mh_pelanggan ${where}`;
    let users = await db.executeQuery(query);
    return users;
}

const deleteUser = async (email) => {
    
    let query = `DELETE FROM mh_pelanggan WHERE email = '${email}'`;
    await db.executeQuery(query);
    return users;
}


module.exports = {
    makeUser,
    userLogin,
    getAllUser,
    deleteUser
}