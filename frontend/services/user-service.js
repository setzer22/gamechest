UserService = function($http, $q, $window) {
    console.log("hmmm");
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
}

angular.module('GameChestApp').service('UserService', ['$http', '$q', '$window', UserService]);