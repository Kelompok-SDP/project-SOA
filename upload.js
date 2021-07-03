const fs = require("fs");
const multer = require("multer");
const OAuth2Data = require("./credentials.json");
var name,pic

const { google } = require("googleapis");

const CLIENT_ID = OAuth2Data.client_id;
const CLIENT_SECRET = OAuth2Data.client_secret;
const REDIRECT_URL = OAuth2Data.redirect_uris[0];

const oAuth2Client = new google.auth.OAuth2(
  CLIENT_ID,
  CLIENT_SECRET,
  REDIRECT_URL
);
var authed = false;

// If modifying these scopes, delete token.json.
const SCOPES =
  "https://www.googleapis.com/auth/drive.file https://www.googleapis.com/auth/userinfo.profile";

var Storage = multer.diskStorage({
  destination: function (req, file, callback) {
    callback(null, "./public/uploads");
  },
  filename: function (req, file, callback) {
    callback(null, file.fieldname + "_" + Date.now() + "_" + file.originalname);
  },
});

var upload = multer({
  storage: Storage,
}).single("file"); //Field name and max count

module.exports ={
    upload
}