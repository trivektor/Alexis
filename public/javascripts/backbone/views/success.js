App.Views.Success = Backbone.View.extend({
	
	className: "result_success",
	
	initialize: function() {
		this.setup_selectors();
		this.render();
	},
	
	setup_selectors: function() {
		this.result_success =	$(".result_success");
	},
	
	render: function() {
		
		this.result_success.remove();
		
		var out = this.options.message
		
		$(this.el).html(out);
		$("#form_header").after($(this.el))
	}
})