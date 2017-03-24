var express = require('express');
var router = express.Router();

router.get('/', function(req, res){
     console.log("Get a request");
     res.send({"success": true});
})

module.exports = router;
