mongoose = require 'mongoose'
async = require 'async'
bcrypt = require 'bcrypt'
jwt = require 'jsonwebtoken'

secret = require('../config').secret
router = require('express').Router()
module.exports = router

Usuario = mongoose.model('Usuario')

auth_router.post '/', (req, res, next) ->
    {name: name, password: password} = req.body
    Usuario.findOne {name: name}, (err, user) ->
        if err
            res.status(500).send(err)
        else if not user
            res.status(500).send('User not found')
        else if user.password != password
            res.status(401).send('Invalid password')
        else
            token = jwt.sign usr.toObject(), secret, {expiresIn: 60*120}
            res.json {token: token}
        

password = 'la_contrasenya'

async.waterfall [
    ((callback) ->
        bcrypt.hash password, 8, callback),
    ((hashed_password, callback) ->
        bcrypt.compare 'la_contrasenya', hashed_password, (err, eq) -> callback err, hashed_password, eq),
    ((eq, hashed_password, callback) ->
        console.log eq
        bcrypt.compare 'la-contrasenya', hashed_password, callback),
    ((eq, callback) ->
        console.log eq
        callback null, null),
    ],
    (err, res) ->
