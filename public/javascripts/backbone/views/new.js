App.Views.New = Backbone.View.extend({
	
	id: "new_business_card",
	
	events: {
		"submit form" : "save"
	},
	
	initialize: function() {
		this.render();
	},
	
	save: function() {
		var self = this;
		this.model.save(
			{	
				business_card : {
					title: this.$("[name=business_card_title]").val(), 
					url: this.$("[name=business_card_url]").val()
				}
			},
			{ 
				success: function(model, response) {
					
					if (response.success == 1) {
						
						self.model = model;

						self.delegateEvents();
						
						window.location.href = "/stage"

						Backbone.history.saveLocation('business_cards/' + model.business_card.id)
					}
					else {
						new App.Views.Errors({errors: response.errors});
					}
				},
				error: function() {
					alert('An error occured while creating your card. Please try again later');
				}
			}
		);
		return false;
	},
	
	render: function() {
		
		$(this.el).html(JST.new_business_card({}));
		$("#stage").html($(this.el))

	}
})