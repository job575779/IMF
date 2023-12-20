angular.module('demo').factory('TreeTableData', function() {
	return function TreeTableData(options) {
		console.log(options.memeber);
		this.member = options.member || {};
		this.rows = options.rows;
		this.headerName = options.headerName;
		this.categoryName = options.categoryName;
		this.remove = options.remove;
		this.add = options.add;
	}
});
