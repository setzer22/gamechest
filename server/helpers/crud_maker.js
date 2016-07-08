var express = require('express');

function handle(res) {
    return function(err, result) {
        if (err) res.status(500).json(err);
        else res.status(200).json(result);
    }
}

module.exports = function(model, population) {
    var router = express.Router();

    population = population || '';

    router.get('/', function(req, res) {
        model.find(req.body || {}, handle(res)).populate(population);
    });

    router.get('/:id', function(req, res) {
        model.findById(req.params.id, handle(res)).populate(population);
    });

    router.post('/', function(req, res) {
        new model(req.body).save(handle(res));
    });

    router.patch('/:id', function(req, res) {
        model.findByIdAndUpdate(req.params.id, req.body, handle(res));
    });

    router.delete('/:id', function(req, res) {
        model.findByIdAndRemove(req.params.id, handle(res));
    });
    
    return router;
}
