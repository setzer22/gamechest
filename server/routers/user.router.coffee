mongoose = require 'mongoose'
async = require 'async'
bcrypt = require 'bcrypt'
jwt = require 'jsonwebtoken'

secret = require('../config').secret
router = require('express').Router()
module.exports = router

Usuario = mongoose.model('Usuario')

#TODO: ALL