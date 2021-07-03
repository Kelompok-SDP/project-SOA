const db = require('../Database');

function convertToRp(number){
    const format = number.toString().split('').reverse().join('');
    const convert = format.match(/\d{1,3}/g);
    const fullrupiah = 'Rp ' + convert.join('.').split('').reverse().join('');
    return fullrupiah;
}

const getProdusen = async(tipe, limits, kota,id,nama)=>{
    let data = null;
    if(parseInt(tipe) == 1){
        let ctr = 0;
        
        if(kota != ""){   
            ctr++;
        }
        if(nama != ""){  
            ctr++;
        }

        let query = null;

       if(limits !=""){
            if(ctr == 0 ){
                query = ` Select kode as kode_produsen, nama as nama_produsen, bidangusaha as bidang_usaha, email as email_produsen, telepon, alamat, kota, kodepos as kode_pos, cp_nama, cp_jabatan, cp_telepon, cp_email, keterangan from mh_produsen limit ${parseInt(limits)}`;
            }
            else if(ctr == 1){
               if(kota != ""){
                     query = ` Select kode as kode_produsen, nama as nama_produsen, bidangusaha as bidang_usaha, email as email_produsen, telepon, alamat, kota, kodepos as kode_pos, cp_nama, cp_jabatan, cp_telepon, cp_email, keterangan from mh_produsen  where kota like '%${kota}%' limit ${parseInt(limits)}`;
               }

               if(nama != ""){
                    query = ` Select kode as kode_produsen, nama as nama_produsen, bidangusaha as bidang_usaha, email as email_produsen, telepon, alamat, kota, kodepos as kode_pos, cp_nama, cp_jabatan, cp_telepon, cp_email, keterangan from mh_produsen  where nama like '%${nama}%' limit ${parseInt(limits)}`;
               }
            } else{
                query = ` Select kode as kode_produsen, nama as nama_produsen, bidangusaha as bidang_usaha, email as email_produsen, telepon, alamat, kota, kodepos as kode_pos, cp_nama, cp_jabatan, cp_telepon, cp_email, keterangan from mh_produsen  where kota like '%${kota}%' and nama like '%${nama}%'  limit ${parseInt(limits)}`;
            }
       } else{
            if(ctr == 0 ){
                query = ` Select kode as kode_produsen, nama as nama_produsen, bidangusaha as bidang_usaha, email as email_produsen, telepon, alamat, kota, kodepos as kode_pos, cp_nama, cp_jabatan, cp_telepon, cp_email, keterangan from mh_produsen `;
            }
            else if(ctr == 1){
                if(kota != ""){
                    query = ` Select kode as kode_produsen, nama as nama_produsen, bidangusaha as bidang_usaha, email as email_produsen, telepon, alamat, kota, kodepos as kode_pos, cp_nama, cp_jabatan, cp_telepon, cp_email, keterangan from mh_produsen  where kota like '%${kota}%'`;
              }

              if(nama != ""){
                   query = ` Select kode as kode_produsen, nama as nama_produsen, bidangusaha as bidang_usaha, email as email_produsen, telepon, alamat, kota, kodepos as kode_pos, cp_nama, cp_jabatan, cp_telepon, cp_email, keterangan from mh_produsen  where nama like '%${nama}%'`;
              }
            } else{
                query = ` Select kode as kode_produsen, nama as nama_produsen, bidangusaha as bidang_usaha, email as email_produsen, telepon, alamat, kota, kodepos as kode_pos, cp_nama, cp_jabatan, cp_telepon, cp_email, keterangan from mh_produsen  where kota like '%${kota}%' and nama like '%${nama}%'`;
            }
       }
        data = await db.executeQuery(query)
    }else if(parseInt(tipe) == 2){
        let query = `Select kode as kode_produsen, nama as nama_produsen, bidangusaha as bidang_usaha, email as email_produsen, telepon, alamat, kota, kodepos as kode_pos, cp_nama, cp_jabatan, cp_telepon, cp_email, keterangan from mh_produsen where kode  = '${id}'`
        data = await db.executeQuery(query);
    }
    return data
}

const searchProductWithLimit = async (nama, desk, limit, type, aihit) => {
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
        let whereName = ""; let whereDesc = ""; let conjuction = "";
        if(nama && desk){
            conjuction =  ` AND `;
        }
        if(nama){
            whereName = `NAMA LIKE '${nama}%'`;
            if(desk){
                whereDesc = `INDIKASI LIKE '%${desk}%'`;
            }
        }
        const array = [];
        let matches = limit.match("[a-zA-Z]+");
            if(matches == null){
                let select = `SELECT * FROM mh_produk WHERE ` + whereName + conjuction + whereDesc + ` AND STATUS = 1 LIMIT ${limit}`;
                console.log(select);
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

const addProduct = async (nama,kat,produsen,satuan,indik,kompos,dosis,aturan,kemasan,harga,resep,keterangan,foto_produk) => {
    let statinput = 0; 
    let strkat; let strprod; let strsat; let strresep; let rupiah;
    let signature = 'PR';

    let space = nama.toString().search(' ');
    let inital_nama = space != -1 ? 
    nama.toString().substr(0,2) : nama.toString().substr(0,1) 
    + nama.toString().substr(space+1,1);


    let newKodePr = signature + '_' +inital_nama.toString().toUpperCase();
    let kode = await db.idMax('KODE','mh_produk',`WHERE KODE LIKE '${newKodePr}%'`);
    newKodePr += kode;

    let select = `SELECT * FROM mh_kategori WHERE KODE = '${kat}'`;
    let hasil = await db.executeQuery(select);
    if(hasil.length > 0){
        kat = hasil[0].kode;
        strkatl = hasil[0].nama; 
        select = `SELECT * FROM mh_produsen WHERE KODE = '${produsen}'`;
        hasil = await db.executeQuery(select);
        if(hasil.length > 0){
            produsen = hasil[0].kode;
            strprod = hasil[0].nama; 
            select = `SELECT * FROM mh_satuan WHERE KODE = '${satuan}'`;
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
        let query = `INSERT INTO mh_produk VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?,1,"Admin",STR_TO_DATE('${tglinsert}', '%d/%m/%Y'),NULL,NULL)`;
        await db.executeQueryWithParam(query,[newKodePr,kat,produsen,satuan,nama,indik,kompos,dosis,aturan,kemasan,harga,resep,keterangan,foto_produk]);
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
                foto_produk,
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

const updProduct = async (id,produsen,harga,kemasan,keterangan,foto_produk) => {
    let tmpnama; let tmpkat; let tmpprodus; let tmphar; let tmpkemas;
    let select = `SELECT * FROM mh_produk WHERE KODE = '${id}'`;
    let hasil = await db.executeQuery(select);
    if(hasil.length > 0){
        tmpnama = hasil[0].nama;
        tmpkat = hasil[0].fk_kategori;
        tmpprodus = hasil[0].fk_produsen;
        tmpkemas = hasil[0].kemasan;
        tmphar = hasil[0].harga;
        const oldrupiah = convertToRp(tmphar);

        select = `SELECT * FROM mh_produsen WHERE KODE = '${tmpprodus}'`;
        hasil = await db.executeQuery(select);
        let oldProdus = hasil[0].nama;
        select = `SELECT * FROM mh_kategori WHERE KODE = '${tmpkat}'`;
        hasil = await db.executeQuery(select);
        tmpkat = hasil[0].nama;
        select = `SELECT * FROM mh_produsen WHERE KODE = '${produsen}'`;
        hasil = await db.executeQuery(select);
        if(hasil.length > 0){
            let newProdus = hasil[0].nama;
            let matches = harga.match("[a-zA-Z]+");
            if(matches == null){
                const newrupiah = convertToRp(harga);
                let strmsg = "";
                var tgl = new Date();
                let tglupdate = tgl.getDate() +"/"+ "0"+(tgl.getMonth()+1) +"/"+ tgl.getFullYear();
                let update = `UPDATE mh_produk SET FK_PRODUSEN = '${produsen}',KEMASAN = '${kemasan}', HARGA = '${harga}', 
                            KETERANGAN = '${keterangan}', DIUBAH_OLEH = 'Admin', DIUBAH_PADA = STR_TO_DATE('${tglupdate}', '%d/%m/%Y') WHERE KODE = '${id}'`;
                await db.executeQuery(update);
                if(foto_produk){
                    strmsg = " dan foto produk";
                }
                const Data = {
                    status: 200,
                    msg: 'Berhasil mengubah data produk' + strmsg,
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
    let select = `SELECT * FROM mh_produk WHERE KODE = '${id}' AND STATUS = 1`;
    let hasil = await db.executeQuery(select);
    let tmpnama;
    if(hasil.length > 0){
        tmpnama = hasil[0].nama;
        let deletes = `UPDATE mh_produk SET STATUS = 0 WHERE KODE = '${id}'`;
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



const getProdukById = async(id)=>{
    let data = db.executeQuery(`select kat.nama "Jenis Kategori",sat.nama "Jenis Satuan",pro.nama "Nama Produsen", prod.nama "Nama Produk",prod.indikasi,prod.komposisi,prod.dosis,prod.aturan_pakai,prod.harga,if(prod.butuh_resep=1,'Butuh','Tidak Butuh') "Butuh Resep"
    from mh_produk prod ,mh_kategori kat,mh_produsen pro,mh_satuan sat
    where kat.kode=prod.fk_kategori and 
    pro.kode=prod.fk_produsen and
    sat.kode=prod.fk_satuan and
    prod.kode='${id}'`);
    return data
}

const getProduk = async(where)=>{
    let data = db.executeQuery(`select * from mh_produk ${where}`);
    return data
}

const addDeskripsi = async(value)=>{
    let data = db.executeQuery(`insert into mh_deskripsi_produk ${value}`);
    return data
}
const getProdukNewDeskripsi = async(where ='')=>{
    let data = db.executeQuery(`select mhdp.id,mhp.nama "Nama",mhp.indikasi "Deskripsi",mhdp.isi_deskripsi "New Deskripsi" from mh_produk mhp
    join mh_deskripsi_produk mhdp on mhdp.id_produk=mhp.kode ${where}`);
    return data
}
const UpdateProdukNewDeskripsi = async(id)=>{
    let dataDeskripsi = await db.executeQuery(`select * from mh_deskripsi_produk where id='${id}'`);
    console.log(dataDeskripsi)
    let data={
        "status":0
    }
    if(dataDeskripsi[0].status==0){
        await db.executeQuery(`update mh_produk set indikasi = '${dataDeskripsi[0].isi_deskripsi}' where kode = '${dataDeskripsi[0].id_produk}' `);
        data.data = await getProdukNewDeskripsi(`where mhdp.id = '${id}'`);
        data.status=200;
        await db.executeQuery(`update mh_deskripsi_produk set status = '1' where id = '${id}' `);
    }else{
        data.data={
            "error":"Data deskripsi sudah pernah digunakan",
        }
        data.status=400;
    }
    return data
}


const getKategoriProduk  = async(limits,nama,deskripsi)=>{
    let data = null;
    let ctr = 0;
    
    if(deskripsi != ""){   
        ctr++;
    }
    if(nama != ""){  
        ctr++;
    }

    let query = null;

    if(limits !=""){
        if(ctr == 0 ){
            query = ` Select nama as nama_kategori, deskripsi as deskripsi_kategori from mh_kategori limit ${parseInt(limits)}`;
        }
        else if(ctr == 1){
            if(deskripsi != ""){
                    query = ` Select nama as nama_kategori, deskripsi as deskripsi_kategori from mh_kategori  where deskripsi like '%${deskripsi}%' limit ${parseInt(limits)}`;
            }

            if(nama != ""){
                query = `select nama as nama_kategori, deskripsi as deskripsi_kategori from mh_kategori  where nama like '%${nama}%' limit ${parseInt(limits)}`;
            }
        } else{
            query = `select nama as nama_kategori, deskripsi as deskripsi_kategori from mh_kategori where deskripsi like '%${deskripsi}%' and nama like '%${nama}%'  limit ${parseInt(limits)}`;
        }
    } else{
        if(ctr == 0 ){
            query = ` Select nama as nama_kategori, deskripsi as deskripsi_kategori from mh_kategori `;
        }
        else if(ctr == 1){
            if(deskripsi != ""){
                    query = ` Select nama as nama_kategori, deskripsi as deskripsi_kategori from mh_kategori  where deskripsi like '%${deskripsi}%' `;
            }

            if(nama != ""){
                query = `select nama as nama_kategori, deskripsi as deskripsi_kategori from mh_kategori  where nama like '%${nama}%'`;
            }
        } else{
            query = `select nama as nama_kategori, deskripsi as deskripsi_kategori from mh_kategori where deskripsi like '%${deskripsi}%' and nama like '%${nama}%'  `;
        }
    }
    data = await db.executeQuery(query)

    return data
}


module.exports = {
    getProdusen,
    searchProductWithLimit,
    addProduct,
    updProduct,
    delProduct,
    getProdukById,
    getProduk,
    addDeskripsi,
    getKategoriProduk,
    getProdukNewDeskripsi,
    UpdateProdukNewDeskripsi
}