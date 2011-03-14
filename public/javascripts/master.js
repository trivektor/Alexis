var Theme = {
	
	init : function() {
		this.setup_selectors();
		this.open_theme_gallery();
		this.close_theme_gallery();
		this.setup_theme_select();
	},
	
	setup_selectors : function() {
		this.select_theme_btn = $("#select_theme");
		this.theme_gallery = $("#theme_gallery");
		this.close_theme_gallery_btn = $("#close_theme_gallery");
		this.theme_preview = $(".theme_preview");
	},
	
	open_theme_gallery : function() {
		this.select_theme_btn.click(function() {
			Theme.theme_gallery.fadeIn(500)
		})
	},
	
	close_theme_gallery : function() {
		this.close_theme_gallery_btn.click(function() {
			Theme.theme_gallery.fadeOut(500)
		})
	},
	
	selected_theme_id : function(selected) {
		return selected.attr("rel")
	},
	
 	setup_theme_select : function() {
		
		Theme.theme_preview.click(function() {
			$.ajax({
				type: "POST",
				url: "/business_cards/" + BusinessCard.id + "/select_theme",
				data: {
					id: BusinessCard.id,
					theme_id: Theme.selected_theme_id($(this))			
				},
				success: function(response) {
					
				}
			})
		})
	}
	
}

var BusinessCard = {
	
	init : function() {
		this.setup_selectors();
		this.id = this.business_card_id.val();
	},
	
	setup_selectors : function() {
		this.business_card_id = $("#business_card_id")
	}
	
}

$(function() {

	BusinessCard.init();
	
	Theme.init();
	
	$(".tooltip").tooltip({
		showURL: false,
		track: true,
		delay: 0,
		left: -40,
		top: 20
	})
	
})