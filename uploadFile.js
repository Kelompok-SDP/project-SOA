const multer = require("multer");

const storage=multer.diskStorage({
    destination:function(req,file,callback){
        callback(null,'./public/uploads');
    },
    filename:async function(req,file,callback){
        const extension = file.originalname.split('.')[file.originalname.split('.').length-1];
        const filename = req.body.nama_user;
        callback(null,(filename+'.'+extension));
    }
});

function checkFileType(file,cb){
    const filetypes= /jpeg|jpg|png|gif/;
    const extname=filetypes.test(file.originalname.split('.')[file.originalname.split('.').length-1]);
    const mimetype=filetypes.test(file.mimetype);
    
    if(mimetype && extname){
        return cb(null,true);
    }else{
        cb(error = 'Error : Image Only!');
    }
}


const upload=multer({

    storage:storage,
    fileFilter: function(req,file,cb){
        checkFileType(file,cb);
    }
});

module.exports ={
    storage,
    upload,
    checkFileType
}