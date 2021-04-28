const db = require('../Database');
const auth = require('../autentikasi');

const getProdusen = async(id,nama)=>{
    let data = db.executeQuery('select * from mh_produsen');
    return data
}

module.exports = {
   getProdusen
}