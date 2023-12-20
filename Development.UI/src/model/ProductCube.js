angular.module('demo').factory('ProductCube', ['TreeTableData', function(TreeTableData) {

	var Cube = window.Cube;

	function ProductCube() {
		const cube = Cube.apply(this, arguments);
		return cube;
	}

	ProductCube.prototype = Object.create(Cube.prototype);
	ProductCube.prototype.constructor = ProductCube;
	Object.setPrototypeOf(ProductCube, Cube);

	var productCubePrototype = {
		constructor: ProductCube,

		getFactTable: function(factTable){
			return new TreeTableData({
				headerName: 'Fact Table',
				categoryName: 'Date category',
				rows: factTable.map(function(member) {
					return new TreeTableData({ member: member })
				}),
				//todo methods for add/remove rows of fact table
			})
		},
		getFactTableOutput: function() {
			var self = this;
			return new TreeTableData({
				headerName: 'Fact Table',
				rows: self.getFacts().map(function(member) {
					return new TreeTableData({ member: member })
				})
			})
    },

		
    // year, qr, month
    // country, indicator, date
    
    getCountryIndicatorDateValue: function() {
			var self = this;
			return new TreeTableData({
				headerName: 'Country Name',
				categoryName: 'Country Category',
				add: function (member) { self.addDimensionMember('countryName', member) },
				remove: function (member) { self.removeDimensionMember('countryName', member) },
				rows: self.getDimensionMembers('countryName').map(function (countryName) {
					var space = {};
					if (countryName) {
						space.countryName = countryName;
					}

					return new TreeTableData({
						member: countryName,
						headerName: 'Indicator Name',
						categoryName: 'Indicator Category',
						remove: function (member) { self.removeDimensionMember('indicatorName', member) },
						add: function (member) { self.addDimensionMember('indicatorName', member, space) },
						rows: self.dice(space).getDimensionMembers('indicatorName').map(function (indicatorName) {
							var space = {};
							if (indicatorName) {
								space.indicatorName = indicatorName
							}

							return new TreeTableData({
								headerName: 'Date',
								member: indicatorName,
								categoryName: 'Date Category',
								remove: function (member) { self.removeDimensionMember('date', member) },
								add: function (member) { self.addDimensionMember('date', member, space) },
								rows: self.dice(space).getDimensionMembers('date').map(function (date) {
									var space = {};
									if (date) {
										space.date = date
									}

									return new TreeTableData({
										headerName: 'Value',
										member: date,
										remove: function (member) { self.removeDimensionMember('value', member) },
										add: function (member) { self.addDimensionMember('value', member, space) },
										rows: self.dice(space).getDimensionMembers('value').map(function (value) {
											return new TreeTableData({
												member: value
											})
										})
									})
								})
							})
						})
					})
				})
			})
		}
	};

	for (var key in productCubePrototype) {
		if (productCubePrototype.hasOwnProperty(key)) {
			ProductCube.prototype[key] = productCubePrototype[key]
		}
	}

	return ProductCube
}]);