const db = require('../Database');
const auth = require('../autentikasi');

const getProdusen = async(tipe, limit, kota,id,nama)=>{
    let data = null;
    if(parseInt(tipe) == 1){
        let qlimit = "";
        let ctr = 0;
        
        if(kota != ""){   
            ctr++;
        }
        if(nama != ""){  
            ctr++;
        }

        let query = null;

       if(limit != 0){
            if(ctr == 0 ){
                query = ` Select kode as kode_produsen, nama as nama_produsen, bidangusaha as bidang_usaha, email as email_produsen, telepon, alamat, kota, kodepos as kode_pos, cp_nama, cp_jabatan, cp_telepon, cp_email, keterangan from mh_produsen limit ${parseInt(limit)}`;
            }
            else if(ctr == 1){
                query = ` Select kode as kode_produsen, nama as nama_produsen, bidangusaha as bidang_usaha, email as email_produsen, telepon, alamat, kota, kodepos as kode_pos, cp_nama, cp_jabatan, cp_telepon, cp_email, keterangan from mh_produsen limit ${parseInt(limit)} where kota like '%${kota}%'`;
            } else{
                query = ` Select kode as kode_produsen, nama as nama_produsen, bidangusaha as bidang_usaha, email as email_produsen, telepon, alamat, kota, kodepos as kode_pos, cp_nama, cp_jabatan, cp_telepon, cp_email, keterangan from mh_produsen limit ${parseInt(limit)} where kota like '%${kota}%' and nama like '%${nama}%'`;
            }
       } else{
            if(ctr == 0 ){
                query = ` Select kode as kode_produsen, nama as nama_produsen, bidangusaha as bidang_usaha, email as email_produsen, telepon, alamat, kota, kodepos as kode_pos, cp_nama, cp_jabatan, cp_telepon, cp_email, keterangan from mh_produsen `;
            }
            else if(ctr == 1){
                query = ` Select kode as kode_produsen, nama as nama_produsen, bidangusaha as bidang_usaha, email as email_produsen, telepon, alamat, kota, kodepos as kode_pos, cp_nama, cp_jabatan, cp_telepon, cp_email, keterangan from mh_produsen  where kota like '%${kota}%'`;
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

module.exports = {
   getProdusen
}