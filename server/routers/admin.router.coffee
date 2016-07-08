mongoose = require 'mongoose'
async = require 'async'
bcrypt = require 'bcrypt'
jwt = require 'jsonwebtoken'
crudRouterMaker = require '../helpers/crud_maker'

secret = require('../config').secret
router = require('express').Router()
module.exports = router


Usuario = mongoose.model('Usuario')

router.use '/users', crudRouterMaker(User, 'Game');
router.use '/games', crudRouterMaker(Game);
