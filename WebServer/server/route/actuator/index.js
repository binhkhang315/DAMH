var express = require('express');
var router = express.Router();
var models = require('../../models');
var sequelize = require('sequelize');

router.post('/controlActuator', function(req, res){
     models.Actuator.findOne({
          where:{
               actuator: req.body.actuator
          }
     }).then(function(actuator){
          if(!actuator){
               var dataSend = {
                    msg: "Can't find actuator",
                    success: false
               }
               res.send(dataSend);
          }else{
               models.Actuator.setStatus(req.body.actuator, req.body.status, function(){
                    var dataSend= {
                         msg: "Set actuator status success",
                         success: true
                    }
                    res.send(dataSend);
               });
          }
     });
});

router.post('/actuatorStatus', function(req, res){
     models.Actuator.findOne({
          where:{
               actuator: req.body.actuator
          }
     }).then(function(actuator){
          if(!actuator){
               res.send({success: false});
          }else{
               res.send({status: actuator.status})
          }
     });
})

module.exports = router;
