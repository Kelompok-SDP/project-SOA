const db = require('../Database');

function convertToRp(number){
    const format = number.toString().split('').reverse().join('');
    const convert = format.match(/\d{1,3}/g);
    const fullrupiah = 'Rp ' + convert.join('.').split('').reverse().join('');
    return fullrupiah;
}

const searchProductWithLimit = async (nama, desk, limit, type) => {
    let statinput = 0;
    if(type == 0){
        if(limit > 10){
            statinput = 1;
        }
    }else if(type == 1){
        if(limit > 50){
            statinput = 1;
        }
    }
    if(statinput == 0){
        let whereName = ""; let whereDesc = "";
        if(nama){
            whereName = `NAMA LIKE '${nama}%'`;
            if(desk){
                whereDesc = `AND INDIKASI LIKE '%${desk}%'`;
            }
        }
        const array = [];
        let matches = limit.match("[a-zA-Z]+");
            if(matches == null){
                let select = `SELECT * FROM MH_PRODUK WHERE ` + whereName + whereDesc + ` LIMIT ${limit}`;
                let hasil = await db.executeQuery(select);
                if(hasil.length > 0){
                    hasil.forEach(element => {
                        let product = {
                            nama: element.nama,
                            deskripsi: element.indikasi
                        }
                        array.push(product);
                    });
                }
                const Data = {
                    status: 200,
                    msg: `Berhasil mencari ${hasil.length} produk dari limit ${limit} data`,
                    data:{
                        arrayOfProduct: array
                    }
                }
                return Data;
            }else{
                return {
                    status: 400,
                    msg: `Maaf, limit jumlah pencarian data hanya angka`
                }
            }
    }else{
        return {
            status: 400,
            msg: `Maaf, Anda melebih limit jumlah pencarian data, mohon upgrade akun Anda`
        }
    }
}

const addProduct = async (nama,kat,produsen,satuan,indik,kompos,dosis,aturan,kemasan,harga,resep,keterangan) => {
    let statinput = 0; 
    let strkat; let strprod; let strsat; let strresep; let rupiah;
    let signature = 'PR';

    let space = nama.toString().search(' ');
    let inital_nama = space != -1 ? 
    nama.toString().substr(0,2) : nama.toString().substr(0,1) 
    + nama.toString().substr(space+1,1);


    let newKodePr = signature + '_' +inital_nama.toString().toUpperCase();
    let kode = await db.idMax('KODE','MH_PRODUK',`WHERE KODE LIKE '${newKodePr}%'`);
    newKodePr += kode;

    let select = `SELECT * FROM MH_KATEGORI WHERE KODE = '${kat}'`;
    let hasil = await db.executeQuery(select);
    if(hasil.length > 0){
        kat = hasil[0].kode;
        strkatl = hasil[0].nama; 
        select = `SELECT * FROM MH_PRODUSEN WHERE KODE = '${produsen}'`;
        hasil = await db.executeQuery(select);
        if(hasil.length > 0){
            produsen = hasil[0].kode;
            strprod = hasil[0].nama; 
            select = `SELECT * FROM MH_SATUAN WHERE KODE = '${satuan}'`;
            hasil = await db.executeQuery(select);
            if(hasil.length > 0){
                satuan = hasil[0].kode;
                strsat = hasil[0].nama; 
                let matches = harga.match("[a-zA-Z]+");
                if(matches == null){
                    rupiah = convertToRp(harga);
                    console.log(rupiah);
                    if(resep == 0){
                        strresep = "Tidak";
                    }else{
                        strresep = "Ya";
                    }
                }else{
                    statinput = 4;
                }
            }else{
                statinput = 3;
            }
        }else{
            statinput = 2;
        }
    }else{
        statinput = 1;
    }
    if(statinput == 0){
        var tgl = new Date();
        let tglinsert = tgl.getDate() +"/"+ "0"+(tgl.getMonth()+1) +"/"+ tgl.getFullYear();
        let query = `INSERT INTO MH_PRODUK VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,1,"Admin",STR_TO_DATE('${tglinsert}', '%d/%m/%Y'),NULL,"")`;
        await db.executeQueryWithParam(query,[newKodePr,kat,produsen,satuan,nama,indik,kompos,dosis,aturan,kemasan,harga,resep,keterangan]);
        const Data = {
            status: 201,
            msg: 'Berhasil menambahkan produk baru',
            data:{
                kode: newKodePr,
                nama: nama,
                kategori: strkat,
                produsen: strprod,
                satuan: strsat,
                indikasi: indik,
                komposisi: kompos,
                dosis: dosis,
                aturan_pakai: aturan,
                kemasan: kemasan,
                harga: rupiah,
                butuh_resep: strresep,
                keterangan: keterangan,
                status: 1
            }
        }
        return Data;
    }else if(statinput == 1){
        return {
            status: 404,
            msg: 'Kategori produk tidak ditemukan',
        }
    }else if(statinput == 2){
        return {
            status: 404,
            msg: 'Produsen produk tidak ditemukan',
        }
    }else if(statinput == 3){
        return {
            status: 404,
            msg: 'Satuan produk tidak ditemukan',
        }
    }else{
        return {
            status: 400,
            msg: 'Harga produk hanya angka',
        }
    }
}

const updProduct = async (id,produsen,harga,kemasan,keterangan) => {
    let tmpnama; let tmpkat; let tmpprodus; let tmphar; let tmpkemas;
    let select = `SELECT * FROM MH_PRODUK WHERE KODE = '${id}'`;
    let hasil = await db.executeQuery(select);
    if(hasil.length > 0){
        tmpnama = hasil[0].nama;
        tmpkat = hasil[0].fk_kategori;
        tmpprodus = hasil[0].fk_produsen;
        tmpkemas = hasil[0].kemasan;
        tmphar = hasil[0].harga;
        const oldrupiah = convertToRp(tmphar);

        select = `SELECT * FROM MH_PRODUSEN WHERE KODE = '${tmpprodus}'`;
        hasil = await db.executeQuery(select);
        let oldProdus = hasil[0].nama;
        select = `SELECT * FROM MH_KATEGORI WHERE KODE = '${tmpkat}'`;
        hasil = await db.executeQuery(select);
        tmpkat = hasil[0].nama;
        select = `SELECT * FROM MH_PRODUSEN WHERE KODE = '${produsen}'`;
        hasil = await db.executeQuery(select);
        if(hasil.length > 0){
            let newProdus = hasil[0].nama;
            let matches = harga.match("[a-zA-Z]+");
            if(matches == null){
                const newrupiah = convertToRp(harga);
                var tgl = new Date();
                let tglupdate = tgl.getDate() +"/"+ "0"+(tgl.getMonth()+1) +"/"+ tgl.getFullYear();
                let update = `UPDATE MH_PRODUK SET FK_PRODUSEN = '${produsen}',KEMASAN = '${kemasan}', HARGA = '${harga}', 
                            KETERANGAN = '${keterangan}', DIUBAH_OLEH = 'Admin', DIUBAH_PADA = STR_TO_DATE('${tglupdate}', '%d/%m/%Y') WHERE KODE = '${id}'`;
                await db.executeQuery(update);
                const Data = {
                    status: 200,
                    msg: 'Berhasil mengubah data produk',
                    data:{
                        kode: id,
                        nama: tmpnama,
                        kategori: tmpkat,
                        produsen_lama: oldProdus,
                        produsen_baru: newProdus,
                        kemasan_lama: tmpkemas,
                        kemasan_baru: kemasan,
                        harga_lama: oldrupiah,
                        harga_baru: newrupiah,
                        keterangan_baru: keterangan
                    }
                }
                return Data;
            }else{
                return {
                    status: 400,
                    msg: 'Harga produk hanya angka',
                }
            }
        }else{
            return {
                status: 404,
                msg: 'Id Produsen tidak ditemukan'
            }
        }
    }else{
        return {
            status: 404,
            msg: 'Id Produk tidak ditemukan'
        }
    }
}

const delProduct = async (id) => {
    let select = `SELECT * FROM MH_PRODUK WHERE KODE = '${id}'`;
    let hasil = await db.executeQuery(select);
    let tmpnama;
    if(hasil.length > 0){
        tmpnama = hasil[0].nama;
        let deletes = `UPDATE MH_PRODUK SET STATUS = 0 WHERE KODE = '${id}'`;
        await db.executeQuery(deletes);
        const Data = {
            status: 200,
            msg: `Berhasil menghapus produk ${tmpnama}`,
        }
        return Data;
    }else{
        return {
            status: 404,
            msg: 'Id Produk tidak ditemukan'
        }
    }
}

module.exports = {
    searchProductWithLimit,
    addProduct,
    updProduct,
    delProduct
}