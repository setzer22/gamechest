mongoose = require 'mongoose'
async = require 'async'
bcrypt = require 'bcrypt'
jwt = require 'jsonwebtoken'
crudRouterMaker = require '../helpers/crud_maker'

secret = require('../config').secret
router = require('express').Router()
module.exports = router

Usuario = mongoose.model('Usuario')

# Middleware check if token-user is admin
router.use('*',
    express_jwt({secret: jwt_secret, requestProperty: 'Usuario'}),
    function(req, res, next) {
      
    User.findOne({ nombre: req.Usuario.nombre }, function(err, user) {
      if (err) res.status(500).send(err);
      if (!user) res.status(401).send('Error en la autentificacion:');
      else {
        if (user.password !== req.Usuario.password) {
          res.status(401).send('Error en la autentificacion');
        } else { 
          if (user.isAdmin){  
            #SUCCESS
            next();
          }
          # Mensaje de amor
          else res.status(401).send('Ets un fill de puta i no ets admin, PUTO HACKER A TU CASA A FREGAR!!');
        }
      }
    });
});

router.use '/users', crudRouterMaker(User, 'Game');
router.use '/games', crudRouterMaker(Game);
