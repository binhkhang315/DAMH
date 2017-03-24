module.exports =
{
     "development": {
          "dialect": "mysql",
          "username": "root",
          "password": "root",
          "database": "do_an_development",
          "host": "127.0.0.1",
          "pool": {
               "max": 5,
               "min": 0,
               "idle": 10000
          },
          port: 3311,
          "logging": false
     },
     "production":{

     }
}
