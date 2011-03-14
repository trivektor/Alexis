var Alexis = {
	
	init : function() {
		this.setup_selectors();
	},
	
	setup_selectors : function() {
		this.overlay = $("#overlay")
	},
	
	toggle_overlay : function() {
		this.overlay.toggle();
	}
	
}

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
		this.theme_gallery_message = $("#theme_gallery_message");
	},
	
	open_theme_gallery : function() {
		this.select_theme_btn.click(function() {
			Alexis.toggle_overlay();
			Theme.theme_gallery.fadeIn(500)
		})
	},
	
	close_theme_gallery : function() {
		this.close_theme_gallery_btn.click(function() {
			Theme.theme_gallery.fadeOut(500, function() {
				Alexis.toggle_overlay();
			})
		})
	},
	
	selected_theme_id : function(selected) {
		return selected.attr("rel")
	},
	
 	setup_theme_select : function() {
		
		Theme.theme_preview.click(function() {
			Theme.theme_gallery_message.text("Applying theme...")
			$.ajax({
				type: "POST",
				url: "/business_cards/" + BusinessCard.id + "/select_theme",
				data: {
					id: BusinessCard.id,
					theme_id: Theme.selected_theme_id($(this))			
				},
				success: function(response) {
					if (response.success == 1) {
						Theme.update_theme_gallery_message({message: "Your business card has been updated", success: 1})
					} else {
						Theme.update_theme_gallery_message({message: "An error occurred while updating your card. Please try again later", success: -1})
					}
				}
			})
		})
	},
	
	update_theme_gallery_message : function(object) {
		var message = Theme.theme_gallery_message.removeClass();
		var fadeSpeed = 500
		var fadeTimeout = 2000
		
		if (object.success == 1) {
			message.addClass("result_success").text(object.message).fadeIn(fadeSpeed);
			setTimeout(function() { message.fadeOut(fadeSpeed)}, fadeTimeout)
		} else {
			message.addClass("result_error").text(object.message).fadeIn(fadeSpeed);
			setTimeout(function() {message.fadeOut(fadeSpeed)}, fadeTimeout)
		}
		
	}
	
}

var BusinessCard = {
	
	init : function() {
		this.setup_selectors();
		this.id = this.business_card_id.val();
		this.setup_order_contact_info();
		this.setup_business_card_section_modal_close();
	},
	
	setup_selectors : function() {
		this.business_card_id = $("#business_card_id")
		this.order_contact_information_btn = $("#order_contact_information");
		this.business_card_section_modal = $("#business_card_section_modal");
		this.close_business_card_section_modal_btn = $("#close_business_card_section_modal");
		this.contact_info_sections = $("#business_card_section_modal .sortable");
	},
	
	setup_order_contact_info : function() {
		this.contact_info_sections.sortable({
			revert: true,
			stop: function() {
				var order = $(this).sortable('serialize', {key:'section[]'});
				
				$.ajax({
					url: "/business_cards/" + BusinessCard.id + "/business_card_section_orders",
					type: "POST",
					data: order,
					success: function() {
						
					}
				})
			}
		});
		
		this.order_contact_information_btn.click(function() {
			Alexis.toggle_overlay();
			BusinessCard.business_card_section_modal.show()
		})
	},
	
	setup_business_card_section_modal_close : function() {
		this.close_business_card_section_modal_btn.click(function() {
			BusinessCard.business_card_section_modal.fadeOut(500, function() {
				Alexis.toggle_overlay();
			});
		})
	}
}

$(function() {
	
	Alexis.init();

	BusinessCard.init();
	
	Theme.init();
	
	if ($(".tooltip").size > 0) {
		$(".tooltip").tooltip({
			showURL: false,
			track: true,
			delay: 0,
			left: -40,
			top: 20
		})
	}
	
	
})