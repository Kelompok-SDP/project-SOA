const express = require("express");
const app = express();
const fs= require("fs");
const morgan=require('morgan');
const accessLogStream  = fs.createWriteStream('./access.log', {flags:'a'},);
app.use(express.urlencoded({extended:true}));

let msg="";
let timeLog = "";

app.use(morgan((tokens,req,res)=>{
    return [
        `Method:${tokens.method(req, res)};`,
        `URL:${tokens.url(req, res)};`,
        `Status:${tokens.status(req, res)};`,
        `Message: ${msg};`,
        `Datetime: ${timeLog};`,
        "ResponseTime: "+ tokens['response-time'](req, res), 'ms',
    ].join(' ')
},{stream:accessLogStream}));

const Users = require('./Routes/Users');
const Produk = require('./Routes/Products');
app.use('/api/users',Users);
app.use('/api/produk',Produk);




app.listen(3000,() => console.log('listening on port 3000'));