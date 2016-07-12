mongoose = require 'mongoose'
async = require 'async'
bcrypt = require 'bcrypt'
jwt = require 'jsonwebtoken'

secret = require('../config').secret
router = require('express').Router()
module.exports = router

Usuario = mongoose.model('Usuario')

#Check User
router.use'*',
    express_jwt({secret: jwt_secret, requestProperty: 'Usuario'}),
    (req, res, next) ->     
      User.findOne { nombre: req.Usuario.nombre }, (err, user) ->
        if (err) res.status(500).send(err)
        if (user.name !== req.Usuario.name) res.status(401).send('Error en la autentificacion:')
        else
          #SUCCESS
          next()
