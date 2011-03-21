var App = {
	Views: {},
	Controllers: {},
	Collections: {},
	init: function() {
		new App.Controllers.BusinessCards();
		Backbone.history.start();
	}
}