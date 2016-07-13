mongoose = require 'mongoose'
async = require 'async'
bcrypt = require 'bcrypt'
jwt_secret = require 'jsonwebtoken'
express_jwt = require 'express-jwt';
secret = require('../config').secret
router = require('express').Router()
module.exports = router

User = mongoose.model('User')

handle = (res) ->
    (err, result)->
        if (err)
          res.status(500).json(err)
        else
          res.status(200).json(result)
          
#Function auxiliar per buscar per id_game
findById = (array, id) ->
  (array.map (i) -> i.id_game).indexOf 'id'
    
    
#Check User
router.use '*',
    express_jwt({secret: jwt_secret, requestProperty: 'User'}),
    (req, res, next) ->     
      User.findOne { nombre: req.User.nombre }, (err, user) ->
        if err 
          res.status(500).send(err)
        if user.name != req.User.name 
          res.status(401).send('Error en la autentificacion:')
        else
          #SUCCESS
          next()

router.get '/',  express_jwt({secret: jwt_secret, requestProperty: 'User'}),
    (req, res) ->     
      User.findOne { nombre: req.User.nombre }, (err, user) ->
        res.status(200).json(user)
        
router.post '/:id_game',  express_jwt({secret: jwt_secret, requestProperty: 'User'}),
    (req, res) ->     
      User.findOne { nombre: req.User.nombre }, (err, user) ->
        if(req.params.id_game in user.game_list.map( (i) -> i.game_id )) #Miramos si existe el juego en la lista del usuario
          index = findById(user.game_list, req.params.id_game)
          user.game_list[index] = req.body
        else
          user.game_list.push(req.body)
        User.save (handle(res)) 
        
router.get '/games',  express_jwt({secret: jwt_secret, requestProperty: 'User'}),
    (req, res) ->     
      User.findOne { nombre: req.User.nombre }, (err, user) ->
        res.status(200).json(user)

