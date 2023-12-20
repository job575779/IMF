angular.module('demo').factory('factTable', function ($http) {
    return {
        getFactTable: function () {
            var data = $http.get('https://localhost:3170/api/v1/Development/itemslist?pageSize=10');
            console.log(data);
            return data;
        }
    }
})