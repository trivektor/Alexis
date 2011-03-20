App.Controllers.BusinessCards = Backbone.Controller.extend({
	
	routes: {
		"business_cards/:id": "edit",
		"new": "newBusinessCard",
		"": "index"
	},
	
	index : function() {
		$.getJSON('/backbone/business_cards', function(data) {
			if (data) {
				var business_cards = _(data).map(function(i) { return new BusinessCard(i) });
				new App.Views.Index({ business_cards: business_cards });
			} else {
				new Error({ message: "Error loading business cards" })
			}
		})
	},
	
	newBusinessCard: function() {
		new App.Views.New({ model: new BusinessCard() });
	},
	
	edit: function(id) {
		var business_card = new BusinessCard({id: id});
		business_card.fetch({
			success: function(model, response) {
				if (response.success == -1) {
					window.location.hash = "#"
					return;
				}
				new App.Views.Edit({model: business_card})
			},
			error: function() {
				new App.Views.Errors({errors: response.errors});
			}
		})
		
	}
})