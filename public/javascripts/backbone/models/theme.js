var Theme = Backbone.Model.extend({
	url : function() {
		var base = 'business_cards';
		return 'backbone/' + base;
	}
})