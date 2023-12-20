
angular.module('demo', []).controller('AppController', ['$scope', 'ProductCube', 'factTable', 'dimensionHierarchies', function ($scope, ProductCube, factTable, dimensionHierarchies) {
	factTable.getFactTable().then(function (response) {

		$scope.dimensionHierarchies = dimensionHierarchies;

		var cube = new ProductCube({ dimensionHierarchies });
		var facts = null;
		facts = response.data.data;

		cube.addFacts(facts);
		$scope.cube = cube;
		window.cube = $scope.cube;
		$scope.factTable = $scope.cube.getFactTable(facts);

		const reset = function () {
			// year, qr, month
			// country, indicator, date
			$scope.countryIndicatorDateValueTable = $scope.cube.getCountryIndicatorDateValue();
		};

		$scope.reset = reset;
		reset();

		$scope.$watch('cube', function () {
			$scope.outputData = $scope.cube.getFactTableOutput();
		}, true);
	});
}]);