mongoose = require 'mongoose'
Schema = mongoose.Schema
bcrypt = require 'bcrypt'
async = require 'async'
express = require 'express'
bodyParser = require 'body-parser'
http = require 'http'

DB_URI = "mongodb://localhost:27017/gamechest"
mongoose.connect DB_URI
db = mongoose.connection
db_ok = false
db.on('error', () -> console.log 'Error connecting to DB')
db.once 'open', () ->
    db_ok = true
    #require('./fill_db.coffee')() <-- UNCOMMENT TO FILL DB. RUN ONLY ONCE

require('./models').initialize()

app = express()

app.use (req, res, next) ->
    if not db_ok
        res.status(500).send("DB connection error")
    else
        next()

app.use bodyParser.json()

auth_router = require('./routers/authenticate.router.coffee')
app.use '/authenticate', auth_router

register_router = require('./routers/register.router.coffee')
app.use '/register', register_router

admin_router = require('./routers/admin.router.coffee')
app.use '/admin', admin_router

user_router = require('./routers/user.router.coffee')
app.use '/user', user_router

http.createServer(app).listen(8080)


