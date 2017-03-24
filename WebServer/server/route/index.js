var router = require('express').Router();
var index = require('./index/index.js');
var sensor = require('./sensor/index.js');
var actuator = require('./actuator/index.js')
router.use('/', index);
router.use('/sensor', sensor);
router.use('/actuator', actuator);

module.exports = router;
