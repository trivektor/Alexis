var BusinessCard = Backbone.Model.extend({
	url : function() {
		var base = 'business_cards';
		if (this.isNew()) return 'backbone/' + base;
		return 'backbone/' + base + (base.charAt(base.length - 1) == '/' ? '' : '/') + this.id
	}
})