UserService = function($http, $q, $window) {
    var get = function(method) {
        return function () {
            console.log("get for "+method);
            var q = $q.defer();
            $http.get("http://localhost:8080/user/"+method)
                .then(
                    function(response) {console.log(response.data); q.resolve(response.data)},
                    function(err) {q.reject(err);}
                );
            return q.promise;
        }
    };

    this.playedGames = get('played_games');
    this.noPlayedGames = get('no_played_games');
    this.allGames = get('all_games');
<<<<<<< HEAD

    this.add_game = function (body) {
        q = $q.defer();
        
        $http.post("http://localhost:8080/user", body).then(
            function (ok) {
                q.resolve(ok);
            },
            function (err) {
                q.resolve(err);
            }
        );

        return q.promise;
    }
=======
    this.game_list = get('game_list');
>>>>>>> 7e1f1f3cb5310a622b58ff19d41364451eb85263
}

angular.module('GameChestApp').service('UserService', ['$http', '$q', '$window', UserService]);
