App.Views.Edit = Backbone.View.extend({
	events: {
		"submit form": "save"
	},
	
	initialize: function() {
		this.render();
	},
	
	save: function() {
		var self = this;
		
		var business_card = this.model.attributes.business_card;
		var business_card_information = business_card.business_card_information;
		
		this.model.save(
		{
			business_card: {
				title: this.$("#title").val(),
				business_card_information_attributes: {
					id: business_card_information.id,
					name: this.$("#name").val(),
					title: this.$("#card_title").val(),
					email: this.$("#email").val(),
					website: this.$("#website").val(),
					phone_number: this.$("#phone_number").val(),
					fax_number: this.$("#fax_number").val(),
					address: this.$("#address").val()
				}
			}
		},
		{
			success: function(model, response) {
				self.model = model;
				new App.Views.Success({message: "Your card has been updated"});
				Backbone.history.saveLocation('business_cards/' + model.attributes.business_card.id);
			},
			error: function() {
				alert('An error occured while creating your card. Please try again later');
			}
		}
		);
		
		return false;
	},
	
	render: function() {
		var business_card = this.model.attributes.business_card;
		var business_card_information = business_card.business_card_information;
			
		for (var key in business_card_information) {
			if (business_card_information[key] == null)
			business_card_information[key] = '';
		}
		
		$(this.el).html(JST.edit_business_card({business_card: business_card, business_card_information: business_card_information}));
		$("#stage").html($(this.el))
		
		this._setup_gallery_opener();
		this._setup_data();
		this._setup_overlay_close();
		
	},
	
	_setup_data : function() {
		var select_theme_btn = $("#select_theme").get(0);
		if (select_theme_btn) {
			$.data(select_theme_btn, 'gallery', 'theme');
		}
		
		var select_background_btn = $("#select_background").get(0);
		if (select_background_btn) {
			$.data(select_background_btn, 'gallery', 'background_color');
		}
	},
	
	_setup_gallery_opener : function() {
		
		var model = this.model;
		
		$(".open_gallery").bind('click', function() {
			
			function open_gallery(gallery, objects, that) {
				$("#overlay").toggle();
		
				//TODO: optimization
				$.ajax({
					url: '/backbone/' + objects,
					type: 'GET',
					data: {},
					success: function(response) {
						
						var html = '';
						
						if (objects == "themes") {
							
							for (var i=0; i < response.length; i++) {
								var theme = response[i].theme;
								html += '<img title="Paint brush" src="/images/themes_gallery/' + theme.slug + '.jpg" rel="' + theme.id + '" class="theme_preview" alt="Paint_brush" />'
							}
							
							$("#theme_list").html(html)
								
							$(".theme_preview").click(function() {
								$.ajax({
									type: "POST",
									url: "/business_cards/" + model.attributes.business_card.id + "/select_theme",
									data: {
										theme_id: $(this).attr("rel")
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
								
							
						} else if (objects == "background_colors") {
							
							for (var i=0; i < response.length; i++) {
								var background_color = response[i].background_color;
								html += '<div style="background:#' + background_color.hex_value + '" class="color_choice" id="' + background_color.hex_value + '"></div>';
							}
								
							$("#color_pallete").html(html);
								
							$(".color_choice").click(function() {
								$.ajax({
									url: '/business_cards/' + model.attributes.business_card.id + '/set_background_color',
									type: 'POST',
									data: {background_color: $(this).attr("id")},
									success: function(response) {
										if (response.success == 1) {
											Alexis.show_alert_message("Your business card has been updated", true)
										} else {

										}
									}
								})
							})
							
						}
						gallery.fadeIn(500)
					}
				})
				
			}
			
			var gallery = $.data($(this).get(0), 'gallery');
			
			open_gallery($("#" + gallery + "_gallery"), gallery + "s", this);
			
		})
	},
	
	_setup_overlay_close : function() {
		$(".close_overlay").bind('click', function() {
			$(this).parent().fadeOut(500, function() {
				$("#overlay").toggle();
			})
		})
	},
	
})