var Alexis = {
	
	init : function() {
		this.setup_selectors();
	},
	
	setup_selectors : function() {
		this.overlay = jQuery("#overlay");
		this.alert = jQuery("#alert");
	},
	
	toggle_overlay : function() {
		this.overlay.toggle();
	},
	
	show_alert_message : function(message, success) {
		
		var alert = Alexis.alert;
		
		if (success) {
			alert.text(message)
			setTimeout
		} else {
			alert.text(message)
		}
		
		alert.slideDown();
		
		setTimeout(function() { Alexis.alert.slideUp().text("") }, 4000)
	}
	
}