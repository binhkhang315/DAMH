var SequelizeDatatypes = require('sequelize');

module.exports=
{
     actuator: {
          type: SequelizeDatatypes.STRING,
          allowNull: false
     },
     status: {
          type: SequelizeDatatypes.STRING,
          allowNull: false
     }
}
