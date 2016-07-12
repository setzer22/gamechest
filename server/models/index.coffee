models = ['./user.model', './game.model']

exports.initialize = () ->
    models.forEach (model) ->
        require(model)()
