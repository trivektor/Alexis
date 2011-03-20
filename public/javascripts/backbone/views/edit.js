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
		
		var out = '<div id="form_header"> \
		<h1 style="float:left">Edit Business Card</h1> \
		<div style="float: right; text-align: right;" class="options"> \
		  <a class="open_gallery" id="select_background">Choose a background</a> | <a class="open_gallery" id="select_theme">Select a theme</a> | <a target="_blank" href="/trivektor2" id="preview_card">View card</a> \
		</div> \
		<div class="clearfloat"></div> \
		</div> \
		<form>\
		<div class="vanilla_region"> \
			<div class="white_region"> \
				<div class="beige_region"> \
					<h2>Basic Information</h2> \
					<div class="form_row"> \
						<label for="business_card_title">Title</label> \
						<input id="title" class="textbox" name="business_card_title" size="30" value="' + business_card.title + '" type="text" /> \
					</div> \
    			<div class="form_row"> \
		        <label for="business_card_business_card_information_attributes_name">Name</label> \
		        <input id="name" class="textbox" name="business_card_information_name" size="30" value="' + business_card_information.name + '" type="text" /> \
		      </div> \
		      <div class="form_row"> \
		        <label>Business card title</label> \
		        <input id="card_title" class="textbox" name="business_card_information_title" size="30" value="' + business_card_information.title + '" type="text" /> \
		      </div> \
		      <h2>Contact Information <span class="concern" id="order_contact_information">order</span></h2> \
		      <div class="form_row"> \
		        <label for="business_card_business_card_information_attributes_email">Email</label> \
		        <input id="email" class="textbox" name="business_card_information_email" size="30" value="' + business_card_information.email + '" type="text" /> \
		      </div> \
		      <div class="form_row"> \
		        <label for="business_card_business_card_information_attributes_website">Website</label> \
		        <input id="website" class="textbox" name="business_card_information_website" size="30" value="' + business_card_information.website + '" type="url" /> \
		      </div> \
		      <div class="form_row"> \
		        <label for="business_card_business_card_information_attributes_phone_number">Phone number</label> \
		        <input id="phone_number" class="textbox" name="business_card_information_phone_number" size="30" value="' + business_card_information.phone_number + '" type="text" /> \
		      </div> \
		      <div class="form_row"> \
		        <label for="business_card_business_card_information_attributes_fax_number">Fax number</label> \
		        <input id="fax_number" class="textbox" name="business_card_information_fax_number" size="30" value="' + business_card_information.fax_number + '" type="text" /> \
		      </div> \
		      <div class="form_row"> \
		        <label for="business_card_business_card_information_attributes_address">Address</label> \
		        <input id="address" class="textbox" name="business_card_information_address" size="30" value="' + business_card_information.address + '" type="text" /> \
		      </div> \
		      <input class="red_btn" id="business_card_submit" name="commit" value="Update" type="submit" /> \
					<a href="#" class="red_btn" id="business_card_submit">Cancel</a> \
				</div> \
			</div> \
		</div> \
		</form>';
			
		$(this.el).html(out);
		$("#stage").html($(this.el))
	}
	
})