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
db.once('open', () -> db_ok = true)


app = express()

app.use (req, res, next) ->
    if not db_ok
        res.status(500).send("DB connection error")
    else
        next()

app.use bodyParser.json()

http.createServer(app).listen(8080)


