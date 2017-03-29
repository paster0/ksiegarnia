angular.module('app')
.service('getBooks', function($http)
{
	  $http.get('rest/product')
	  .success(function(data) {
		  $scope.cart = data;
	  }
	  
	  );

    
});
 