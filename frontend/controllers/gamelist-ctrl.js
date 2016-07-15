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
                    return game;
                });
            },
            function(err) {console.log(err)}
            );

    $scope.valid_attrib = function(attrib_name) {
        return attrib_name !== 'name' && 
               attrib_name !== '_id' &&
               attrib_name !== '__v';
    }

    $scope.add_game = function(index) {
        id = $scope.games[index]._id;
        console.log('id');
        console.log($scope.games[index]);
        UserService.add_game({game_id: id}).then(
            function (ok) {
                $state.go('userhome');
            },
            function (err) {
                ToastService.showToast("Error al añadir juego. Profavor intentalo mas tarde");
            }
        );


         
    }


};

angular.module('GameChestApp').controller('GameListCtrl', ['$scope', 'UserService', '$state', GameListCtrl]);
