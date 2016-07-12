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
router.use '*',
    express_jwt({secret: jwt_secret, requestProperty: 'Usuario'}),
    (req, res, next) ->
      User.findOne { nombre: req.Usuario.nombre }, (err, user) ->
        if (err) res.status(500).send(err);
        if (!user) res.status(401).send('Error en la autentificacion:')
        else
          bcrypt.compare user.password, req.Usuario.password, (err, eq) ->
            if not eq
              res.status(500).json({token: null, err: "Error en la autentificacion:"})
            else 
              if (user.isAdmin) 
                #SUCCESS
                next()
              # Mensaje de amor
              else res.status(401).send('Ets un fill de puta i no ets admin, PUTO HACKER A TU CASA A FREGAR!!')


router.use '/users', crudRouterMaker(User, 'Game');
router.use '/games', crudRouterMaker(Game);

# Encriptar Guia sencilla i interactiva para mongos
# bcrypt.hash(password,8, function(err, hashed_password))