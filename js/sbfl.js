var weechat = angular.module('weechat');

weechat.factory('sbfl', ['$base64', '$http', function($base64, $http) {
    var getWeechatCredentials = function(username, password, successCallback, failCallback) {
        var config = {
            headers: {
                'Authorization': 'Basic ' + $base64.encode(username + ':' + password)
            }
        };
        var promise = $http.get('https://sbfl.eu/bot/weechat.php', config);
        promise.then(function(response) {
            successCallback(response.data);
        });
        promise.catch(function(response) {
            failCallback('error');
        });
    };

    return {
        getWeechatCredentials: getWeechatCredentials
    };
}]);
