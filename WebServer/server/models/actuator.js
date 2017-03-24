var _actuatorModel=require('./DataObjects/actuator');
module.exports = function(sequelize) {
     var Actuator = sequelize.define('Actuator', _actuatorModel, {
          classMethods: {
               setStatus: function(actuator, status, cb){
                    Actuator.update({status: status},{where:{actuator:actuator}}).then(cb);
               }
          },
          tableName: 'actuator',
          timestamps: false
     });
     return Actuator;
};
