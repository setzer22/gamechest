mongoose = require 'mongoose'
async = require 'async'
bcrypt = require 'bcrypt'
jwt_secret = require 'jsonwebtoken'
express_jwt = require 'express-jwt'
secret = require('../config').secret
router = require('express').Router()
merge = require 'merge'
module.exports = router

User = mongoose.model('User')

handle = (res) ->
    (err, result)->
        if (err)
          res.status(500).json(err)
        else
          res.status(200).json(result)
          
#Function auxiliar per buscar per game_id
findById = (array, id) ->
  (array.map (i) -> String(i.game_id)).indexOf id
    
    
#Check User
router.use '*',
    express_jwt({secret: secret, requestProperty: 'User'}),
    (req, res, next) ->    
      User.findOne { name: req.User.name }, (err, user) ->
        if err 
          res.status(500).send(err)
        if user == null
          res.status(401).send('Token caducado (creo):')
        if user.name != req.User.name 
          console.log(user.name)
          console.log(req.User.name)
          res.status(401).send('Error en la autentificacion:')
        else
          #SUCCESS
          next()

router.get '/',  express_jwt({secret: secret, requestProperty: 'User'}),
    (req, res) ->     
      User.findOne { name: req.User.name }, (err, user) ->
        res.status(200).json(user)
        
router.post '/',  express_jwt({secret: secret, requestProperty: 'User'}),
    (req, res) ->     
      User.findOne { name: req.User.name }, (err, user) ->
        #if(req.body.game_id in user.game_list.map( (i) -> i.game_id )) #Miramos si existe el juego en la lista del usuario
        trobat = false
        for i in user.game_list
          if ( String(req.body.game_id) == String(i.game_id)) 
            trobat = true
        if trobat
          index = findById(user.game_list, req.body.game_id)
          user.game_list[index] = merge user.game_list[index], req.body
        else
          user.game_list.push(req.body)
        user.save handle(res)
        
router.get '/games',  express_jwt({secret: secret, requestProperty: 'User'}),
    (req, res) ->     #TODO: ARREGLAR QUE DONI JOCS
      User.findOne({ name: req.User.name }, { game_list : 1}, (err, user) ->
        res.status(200).json(user)).populate('Game')

