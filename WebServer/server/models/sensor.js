var _sensorModel=require('./DataObjects/sensor');
module.exports = function(sequelize) {
    var Sensor = sequelize.define('Sensor', _sensorModel, {
        classMethods: {
               updateData: function(sensor, status, cb){
                    var query = {
                         sensor: sensor,
                         status: status
                    }
                    Sensor.create(query).then(cb);
               }
        },
        tableName: 'sensor',
        timestamps: false
    });
    return Sensor;
};
