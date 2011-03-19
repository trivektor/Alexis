App.Views.Errors = Backbone.View.extend({
	
	className: "result_error",
	
	tagName: "ul",
	
	initialize: function() {
		this.setup_selectors();
		this.render();
	},
	
	setup_selectors: function() {
		this.result_error =	$(".result_error");
	},
	
	render: function() {
		
		this.result_error.remove();
		
		var out = '';
		
		for (var key in this.options.errors) {
			out += '<li>' + key + ' ' + this.options.errors[key] + '</li>';
		}
		
		$(this.el).html(out);
		$("#form_header").after($(this.el))
	}
})