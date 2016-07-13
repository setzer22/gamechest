mongoose = require 'mongoose'
Schema = mongoose.Schema

module.exports = () ->
    console.log 'Filling db with stuff...'
    games = [
        {
            name: "Final Fantasy VI",
            year: "1994",
            platforms: ["SNES", "GBA", "PS1", "PC", "Android", "iOS"],
            genre: "RPG",
            company: "Squaresoft",
            developer: "Hironobu Sakaguchi",
            composer: "Nobuo Uematsu"
        },
        {
            name: "ET",
            year: "1000",
            platforms: ["Wii"],
            genre: "Shit",
            company: "Squaresoft",
            developer: "Koji Kondo",
            composer: "Albert Rubio"
        },
        {
            name: "Xenogears",
            year: "1998",
            platforms: ["PS1"],
            genre: "RPG",
            company: "Squaresoft",
            developer: "Tetsuya Takahashi",
            composer: "Yasunori Mitsuda"
        },
        {
            name: "Super Mario Land",
            year: "2016",
            platforms: ["PS4", "XboxOne", "Nintendo NX"],
            genre: "Shooter",
            company: "Sony Inc.",
            developer: "Shigeru Miyamoto",
            composer: "Hiroshi Fujiyoka"
        },
        {
            name: "The Legend of Don Pepe 2 Final Quest Returns: Edición Amarilla Maximum Comfort 8000 Online",
            year: "2014",
            platforms: ["PC"],
            genre: "Arcade",
            company: "AFP",
            developer: "Daude",
            composer: "Takeshi Kitano"
        }
    ]

    mongoose.model('Game').create(games)

