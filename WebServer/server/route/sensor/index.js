var express = require('express');
var router = express.Router();
var models = require('../../models');
var sequelize = require('sequelize');

router.post('/updateData',function(req, res){
     models.Sensor.updateData(req.body.sensor, req.body.status, function(){
          res.send({success: true});
     })
})

router.post('/test', function(req, res){
    console.log(req.body);
    res.send({success: true});
});

module.exports = router;
