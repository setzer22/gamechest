mongoose = require 'mongoose'
Schema = mongoose.Schema

module.exports = () ->
    userSchema = new Schema({
        name: {type: String, required: true},
        password: {type: String, required: true},
        isAdmin: {type: Boolean, default: false},
        game_list: [{game_id: {type: Schema.Types.ObjectId, ref: 'Game', required: true},
                     state: {type: String, enum: ['Completado', 'Jugando', 'Quiero Jugarlo'], required: true}
                     score: {type: Number, required: false, min: 0, max: 10}
                     platform: {type: String, required: true}
                     first_completion_year: {type: Number}
                     times: [{name: {type: String, required: true},
                              time: {type: String, required: true}
                              year: {type: Number, required: true, min: 0}}]}]})
    mongoose.model('User', userSchema, 'users');