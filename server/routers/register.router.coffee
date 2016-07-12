mongoose = require 'mongoose'
async = require 'async'
bcrypt = require 'bcrypt'

secret = require('../config').secret
token_timeout_seconds = require('../config').token_timeout_seconds

router = require('express').Router()
module.exports = router

User = mongoose.model('User')

router.post '/', (req, res, next) ->
    {name: name, password: password} = req.body
    if not name or not password
        res.status(500).send({err: "invalid_body"})
    else
        bcrypt.hash password, 8, (err, hashed_password) ->
            if err
                res.status(500).json(err)
            else
                new_user = new User({name: name, password: hashed_password})
                new_user.save (err) ->
                    if (err)
                        res.status(500).json(err)
                    else
                        res.status(200).json({state: "ok"})
