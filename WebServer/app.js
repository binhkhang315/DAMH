var express = require('express');
var app = express();
var serverIP = require('./server/config/serverIPAddress');
var bodyParser = require('body-parser');

app.use(bodyParser.json());
// bodyParser.raw();
app.use(bodyParser.urlencoded({
    extended: true
}));

// This responds with "Hello World" on the homepage
app.get('/', function (req, res) {
   console.log("Got a GET request for the homepage");
   res.send({"name":"Khang","phone":"01692348042"});
})

// This responds a POST request for the homepage
app.post('/', function (req, res) {
   console.log("Got a POST request for the homepage");
   console.log(req.body);
   res.send({success: true});
})
// This responds a GET request for abcd, abxcd, ab123cd, and so on

var ipAddress = serverIP.getIP();
console.log(ipAddress);

app.set('port', (process.env.PORT || 80));
var server = app.listen(app.get('port'), ipAddress, function() {
    console.log('Listening to:  ' + ipAddress);
});
