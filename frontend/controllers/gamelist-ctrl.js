var GameListCtrl = function($scope, UserService, $state) {
    $scope.campNames = {"name" : "Nombre",
                        "year": "Año",
                        "platform": "Plataformas",
                        "genre": "Género",
                        "company": "Compañia",
                        "developer": "Desarrollador",
                        "composer": "Compositor",
                        "score": "Puntuación",
                        "platforms": "Plataformas"};

    
    $scope.games = [];
    UserService.allGames().then(
            function(games) {
                $scope.games = games.map(function(game) {
                    delete game._id;
                    delete game.__v;
                    return game;
                });
            },
            function(err) {console.log(err)}
            );


};

angular.module('GameChestApp').controller('GameListCtrl', ['$scope', 'UserService', '$state', GameListCtrl]);
