var express = require('express');
var app = express();
var models = require('./server/models')
var serverIP = require('./server/config/serverIPAddress');
var bodyParser = require('body-parser');

app.use(bodyParser.json());
// bodyParser.raw();
app.use(bodyParser.urlencoded({
     extended: false
}));

models.sequelize.sync({force:false});

app.use('/', require('./server/route/index.js'))

var ipAddress = serverIP.getIP();

app.set('port', (process.env.PORT || 3210));
var server = app.listen(app.get('port'), ipAddress, function() {
     console.log('Listening to:  ' + ipAddress +':'+app.get('port'));
});
