let mysql = require("mysql");
require('dotenv').config();
let pool = mysql.createPool({
    host: "185.232.14.1",
    user: "4URa7hbGjT",
    password: "PMwPzI0k9k",
    database: "4URa7hbGjT"
});

// let pool = mysql.createPool({
//     host: process.env.DB_HOST,
//     user: process.env.DB_USERNAME,
//     password: process.env.DB_PASSWORD,
//     database: process.env.DB_NAME
// });
console.log("H: "+process.env.DB_HOST);
console.log("U: "+process.env.DB_USERNAME);
console.log("P: "+process.env.DB_PASSWORD);
const executeQuery = async (query) => {
    return new Promise((resolve, reject) => {
        pool.query(query, (err, rows, fields) => {
            if (err) reject(err);
            else resolve(rows);
        })
    })
}

const executeQueryWithParam = async (query, param) => {
    return new Promise((resolve, reject) => {
        pool.query(query, param, (err, rows, fields) => {
            if (err) reject(err);
            else resolve(rows);
        })
    })
}

const idMax = async (namaField,namaTable,where) => {
    let query = 
    `SELECT lpad(ifnull(max(substr(${namaField}, -3)), 0) + 1,3, '0') as max from
    ${namaTable} ${where}`;
    console.log(query);
    let kode = await executeQuery(query);
    
    return kode[0].max;
}

//TODO buat kalo tidak ketemu dikeluarkan error tidak ketemu

module.exports= {
    'executeQuery' : executeQuery,
    'executeQueryWithParam' : executeQueryWithParam,
    idMax,
}