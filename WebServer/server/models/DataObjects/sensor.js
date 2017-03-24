var SequelizeDatatypes = require('sequelize');

module.exports=
{
     sensor: {
          type: SequelizeDatatypes.STRING,
          allowNull: false
     },
     status: {
          type: SequelizeDatatypes.STRING,
          allowNull: false
     }
}
