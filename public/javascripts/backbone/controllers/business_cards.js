App.Controllers.BusinessCards = Backbone.Controller.extend({
	
	routes: {
		"business_cards/:id": "edit",
		"business_cards/:id/delete": "delete",
		"new": "newBusinessCard",
		"": "index"
	},
	
	index : function() {
		
		var business_cards = new App.Collections.BusinessCards();
		
		business_cards.fetch({
			success: function() {
				new App.Views.Index({ collection: business_cards })
			}, 
			error: function() {
				
			}
		});
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
	},
	
	delete: function(id) {
		var business_card = new BusinessCard({id: id});
		
		business_card.destroy({
			success: function(model, response) {
				window.location.hash = "#"
			}
		})
		// $.ajax({
		// 			url: "/backbone/business_cards/" + id,
		// 			type: "DELETE",
		// 			success: function(response) {
		// 				if (response.success == 1) {
		// 					window.location.hash = "#";
		// 					new App.Views.Success({message: "Your card has been updated"});
		// 				} else {
		// 					//TODO: implement DELETE error
		// 				}
		// 			}
		// 		})
		
	}
	
})