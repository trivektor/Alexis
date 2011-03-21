App.Views.Index = Backbone.View.extend({
	
	initialize: function() {
		this.render();
	},
	
	render: function() {
		$(this.el).html(JST.business_cards_collection({ collection: this.collection }));
		$("#stage").html(this.el);
	}
})