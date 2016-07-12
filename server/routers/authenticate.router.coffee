mongoose = require 'mongoose'
async = require 'async'
bcrypt = require 'bcrypt'
jwt = require 'jsonwebtoken'

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
        User.findOne {name: name}, (err, user) ->
            if err
                res.status(500).send(err)
            else if not user
                res.status(500).json({token: null, err: "user_not_found"})
            # TODO: Rename to user.hashed_password would make sense
            else bcrypt.compare password, user.password, (err, eq) ->
                if not eq
                    res.status(500).json({token: null, err: "invalid_password"})
                else
                    token = jwt.sign user.toObject(), secret, {expiresIn: token_timeout_seconds}
                    res.json {token: token, err: null}

