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

var Theme = {
	
	init : function() {
		this.setup_selectors();
		this.setup_theme_select();
	},
	
	setup_selectors : function() {
		this.select_theme_btn = jQuery("#select_theme");
		this.theme_gallery = jQuery("#theme_gallery");
		this.close_theme_gallery_btn = jQuery("#close_theme_gallery");
		this.theme_preview = jQuery(".theme_preview");
		this.theme_gallery_message = jQuery("#theme_gallery_message");
	},
	
	selected_theme_id : function(selected) {
		return selected.attr("rel")
	},
	
 	setup_theme_select : function() {
		
		Theme.theme_preview.click(function() {
			Theme.theme_gallery_message.text("Applying theme...")
			jQuery.ajax({
				type: "POST",
				url: "/business_cards/" + BusinessCard.id + "/select_theme",
				data: {
					id: BusinessCard.id,
					theme_id: Theme.selected_theme_id(jQuery(this))			
				},
				success: function(response) {
					if (response.success == 1) {
						Alexis.show_alert_message("Your business card hass been updated", true)
					} else {
						//TODO: add error handling
					}
				}
			})
		})
	}
	
}

var BusinessCard = {
	
	init : function() {
		
		this.setup_selectors();
		this.setup_data(); //custom attributes
		
		this.id = this.business_card_id.val();
		this.setup_order_contact_info();
		this.setup_business_card_section_modal_close();
		this.setup_gallery_opener();
		this.setup_overlay_close();
		this.setup_background_color_choice();
	},
	
	setup_selectors : function() {
		this.business_card_id = jQuery("#business_card_id")
		this.order_contact_information_btn = jQuery("#order_contact_information");
		this.business_card_section_modal = jQuery("#business_card_section_modal");
		this.close_business_card_section_modal_btn = jQuery("#close_business_card_section_modal");
		this.contact_info_sections = jQuery("#business_card_section_modal .sortable");
		this.close_overlay = jQuery(".close_overlay");
		this.theme_gallery = jQuery("#theme_gallery");
		this.background_gallery = jQuery("#background_gallery");
		this.gallery_opener = jQuery(".open_gallery");
		this.select_theme_btn = jQuery("#select_theme");
		this.select_background_btn = jQuery("#select_background");
		this.background_color_choice = jQuery(".color_choice");
	},
	
	setup_data : function() {
		jQuery.data(BusinessCard.select_theme_btn.get(0), 'gallery', 'theme');
		jQuery.data(BusinessCard.select_background_btn.get(0), 'gallery', 'background');
	},
	
	setup_order_contact_info : function() {
		this.contact_info_sections.sortable({
			revert: true,
			stop: function() {
				var order = jQuery(this).sortable('serialize', {key:'section[]'});
				
				jQuery.ajax({
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
	},
	
	setup_gallery_opener : function() {
		BusinessCard.gallery_opener.bind('click', function() {
			
			var gallery = jQuery.data(jQuery(this).get(0), 'gallery');
			
			switch (gallery) {
				case "theme":
					BusinessCard.open_gallery(BusinessCard.theme_gallery)
					break;
				case "background":
					BusinessCard.open_gallery(BusinessCard.background_gallery)
					break;
				default:
					throw new Error("Undefined gallery")
			}
		})
	},
	
	open_gallery : function(gallery) {
		Alexis.toggle_overlay();
		gallery.fadeIn(500)
	},
	
	setup_overlay_close : function() {
		this.close_overlay.bind('click', function() {
			jQuery(this).parent().fadeOut(500, function() {
				Alexis.toggle_overlay();
			})
		})
	},
	
	setup_background_color_choice : function() {
		this.background_color_choice.bind('click', function() {
			var color = jQuery(this).attr("id");
			
			jQuery.ajax({
				url: '/business_cards/' + BusinessCard.id + '/set_background_color',
				type: 'POST',
				data: {background_color: color},
				success: function(response) {
					if (response.success == 1) {
						Alexis.show_alert_message("Your business card has been updated", true)
					} else {
						
					}
				}
			})
		})
	}
}

jQuery(function() {
	
	Alexis.init();

	BusinessCard.init();
	
	Theme.init();
		// 
		// if (jQuery(".tooltip").size > 0) {
		// 	jQuery(".tooltip").tooltip({
		// 		showURL: false,
		// 		track: true,
		// 		delay: 0,
		// 		left: -40,
		// 		top: 20
		// 	})
		// }
	
})