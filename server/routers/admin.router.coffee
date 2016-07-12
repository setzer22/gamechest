mongoose = require 'mongoose'
async = require 'async'
bcrypt = require 'bcrypt'
jwt_secret = require 'jsonwebtoken'
express_jwt = require 'express-jwt';
crudRouterMaker = require '../helpers/crud_maker'

secret = require('../config').secret
router = require('express').Router()
module.exports = router

User = mongoose.model('User')
Game = mongoose.model('Game')

# Middleware check if token-user is admin
router.use '*',
    express_jwt({secret: secret, requestProperty: 'User'}),
    (req, res, next) ->
      User.findOne { name: req.User.name }, (err, user) ->
        if err
          res.status(500).send(err)
        if not user
          res.status(401).send('Error en la autentificacion:')
        else
          bcrypt.compare user.password, req.User.password, (err, eq) ->
            if not eq
              console.log(eq);
              console.log(user.password);
              console.log(req.User.password);
              res.status(500).json({"Error en la autentificacion:"})
            else 
              if (user.isAdmin) 
                #SUCCESS
                next()
              # Mensaje de amor
              else res.status(401).send('Ets un fill de puta i no ets admin, PUTO HACKER A TU CASA A FREGAR!!')


router.use '/users', crudRouterMaker(User, 'Game')
router.use '/games', crudRouterMaker(Game)

# Encriptar Guia sencilla i interactiva para mongos
# bcrypt.hash(password,8, function(err, hashed_password))