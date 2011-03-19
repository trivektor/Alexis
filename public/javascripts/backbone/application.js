var App = {
	Views: {},
	Controllers: {},
	init: function() {
		new App.Controllers.BusinessCards();
		Backbone.history.start();
	}
}