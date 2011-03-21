App.Controllers.Themes = Backbone.Controller.extend({
	
	routes: {
		"": "index"
	},
	
	index : function() {
		$.getJSON('/backbone/themes', function(data) {
			if (data) {
				var themes = _(data).map(function(i) { return new Theme(i) });
				new App.Views.Index({ themes: themes });
			} else {
				new Error({ message: "Error loading business cards" })
			}
		})
	}
})