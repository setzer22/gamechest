mongoose = require 'mongoose'
Schema = mongoose.Schema

module.exports = () ->
    gameSchema = new Schema({
        name: {type: String, required: true},
        year: {type: Number, min: 0},
        platforms: [{type: String}] #TODO: Enum of Platforms
        genre: [{type:String}] #TODO: Enum of 
        company: {type: String} #TODO reference to companyScheme
        developer: {type: String} #TODO reference to developerScheme
        composer: {type:String} #TODO reference to composerScheme
    })
    mongoose.model('Game', gameSchema, 'games')
