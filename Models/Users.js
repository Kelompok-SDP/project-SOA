const db = require('../Database');
const auth = require('../autentikasi');

const makeUser = async (nama,email,password,telepon,sex,tipe_user,foto_user) =>{
    let signature = 'PE';

    let space = nama.toString().search(' ')
    let inital_nama = space != -1 ? 
    nama.toString().substring(0,2) : nama.toString().substring(0,1) 
    + nama.toString().substring(space+1,1);


    let newKode = signature + '_' +inital_nama.toString().toUpperCase();
    let kode = await db.idMax('kode','mh_pelanggan',`WHERE kode LIKE '${newKode}%'`);
    newKode += kode;

    let api_key = auth.genAPIKey(15);
    let saldo = 0;
    let api_hit = 100;
    let query = 'INSERT INTO mh_pelanggan VALUES(?,?,?,?,?,?,?,?,?,?,?)';
    await db.executeQueryWithParam(query,[newKode,nama,email,password,telepon,sex,api_hit,api_key,saldo,tipe_user,foto_user]);

    const Data = {
        status: 201,
        msg: 'berhasil buat user baru',
        data:{
            kode: newKode,
            "api key":api_key,
            "jumlah api hit": api_hit,
            nama,foto_user,email,telepon,
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
    if(user[0].tipe_user == 4){
        console.log("masuk");
        const Data = {
            status:404,
            msg: 'user telah di-banned'
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

const getAllUser = async (where = '',limit) => {
    let query = "";
    if(limit !=0){
         query = `SELECT * FROM mh_pelanggan ${where} ${limit}`;
    }else {
        query = `SELECT * FROM mh_pelanggan ${where} `;
    }
   
    let users = await db.executeQuery(query);
    for (let i = 0; i < users.length; i++) {
        const user = users[i];
        user.jeniskelamin = user.jeniskelamin == 'L' ? 'Laki-Laki' : 'Perempuan';
        delete user.password;
    }
    return users;
}

const updateUser = async (set,where) => {
    let query = `update mh_pelanggan ${set} ${where}`;
    console.log(query);
    let users = await db.executeQuery(query);
    return users;
}

const searchUser = async (email)=>{
    let query = `SELECT * FROM mh_pelanggan WHERE email = '${email}'`;
    let user = await db.executeQuery(query);

    if(user.length > 0){
        return user[0];
    }

    return null;
}
const deleteUser = async (email) => {
    let query = `SELECT nama,email,telepon,api_key FROM mh_pelanggan WHERE email = '${email}'`;
    let user = await db.executeQuery(query);

    query = `UPDATE mh_pelanggan SET tipe_user = 4 WHERE email = '${email}'`;
    await db.executeQuery(query);
    return {
        message: 'user berhasil dihapus',
        user:user[0]
    };
}

const getLogAllUser = async (where,limit,users) => {
    let data = [];
    if(users.length != 0){

        if(where == ""){
            for (let i = 0; i < users.length; i++) {
                const user = users[i];
                let query = `SELECT DATE_FORMAT(tgl_transaksi,\'%d-%m-%Y\') AS tgl_transaksi, 
                kode_pelanggan, jenis_transaksi, keterangan, nominal FROM log_transaksi WHERE kode_pelanggan = '${user.kode}'
                 ${limit} `;
                let Data = await db.executeQuery(query);
                data.push(Data[0]);
            }
        }
        else{
            for (let i = 0; i < users.length; i++) {
                const user = users[i];
                let query = `SELECT DATE_FORMAT(tgl_transaksi,\'%d-%m-%Y\') AS tgl_transaksi, 
                kode_pelanggan, jenis_transaksi,keterangan, nominal FROM log_transaksi ${where} AND kode_pelanggan = '${user.kode}'
                    ${limit} `;
                let Data = await db.executeQuery(query);
                data.push(Data[0]);
            }
           
        }
        
    }
    else{
        let query = `SELECT DATE_FORMAT(tgl_transaksi,\'%d-%m-%Y\') AS tgl_transaksi, 
        kode_pelanggan, jenis_transaksi,keterangan, nominal FROM log_transaksi ${where} 
            ${limit} `;
        let Data = await db.executeQuery(query);
        data.push(Data[0]);
    }

    // for (let i = 0; i < data.length; i++) {
    //     const d = data[i];
    //     let temp = d.tgl_transaksi.toString();
    //     console.log(temp);
    // }
    return data;
    
}

//===== SHAN
const getUser = async (userId) => {
    let query = `SELECT * FROM mh_pelanggan WHERE KODE = '${userId}'`;
    let hasil = await db.executeQuery(query);

    if(hasil.length > 0){
        let strtipe; let strjk;
        if(hasil[0].tipe_user == 0){
            strtipe = "Free";
        }else if(hasil[0].tipe_user == 1){
            strtipe = "Advance";
        }else{
            strtipe = "Profesional";
        }

        if(hasil[0].jeniskelamin == 'P'){
            strjk = "Perempuan";
        }else{
            strjk = "Laki-laki";
        }
        const numb = hasil[0].saldo;
        const format = numb.toString().split('').reverse().join('');
        const convert = format.match(/\d{1,3}/g);
        const rupiah = 'Rp ' + convert.join('.').split('').reverse().join('');

        return {
            status: 200,
            msg: 'Berhasil ambil data user',
            data:{
                nama: hasil[0].nama,
                nomor_telepon: hasil[0].telepon,
                jenis_kelamin: strjk,
                email: hasil[0].email,
                saldo: rupiah,
                tipe: strtipe
            }
        }
    }else{
        return {
            status: 404,
            msg: 'User tidak ditemukan, ubah parameter Id User',
        }
    }
}


const getUserFromAPiKey = async (apikey) =>{
    let user = null;
    let query =  `select * from mh_pelanggan where api_key = '${apikey}' AND tipe_user != 4`;
    user = await db.executeQuery(query);
    if(user.length == 0){
        return "User telah di-banned";
    }
    return user[0];
}

const decreaseApihit = async (apikey) =>{
    let user  = null;
    let apihit =0;

    let query =  `select * from mh_pelanggan where api_key = '${apikey}'`;
    user = await db.executeQuery(query);
    apihit = parseInt(user[0].api_hit);
   
    if(apihit > 0){
        apihit = apihit - 1;
    }

    let query_update_user = `update mh_pelanggan set api_hit = ${apihit} where api_key = '${apikey}'`;
    await db.executeQuery(query_update_user);
    
    return apihit;
}

const makeLog = async (kodeuser,keterangan,total,jenis_transaksi) =>{
    var today = new Date();
    var date = today.getFullYear()+'-'+(today.getMonth()+1)+'-'+today.getDate();
    let query = `insert into log_transaksi values(0,'${date}','${kodeuser}','${jenis_transaksi}',${parseInt(total)},'${keterangan}')`
    console.log(query);
    let data =  await db.executeQuery(query);
    return data;
}


module.exports = {
    makeUser,
    userLogin,
    getAllUser,
    deleteUser,
    updateUser,
    getUser,
    getUserFromAPiKey,
    decreaseApihit,
    searchUser,
    getLogAllUser,
    makeLog
}