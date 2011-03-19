App.Views.Edit = Backbone.View.extend({
	events: {
		"submit form": "save"
	},
	
	initialize: function() {
		this.render();
	},
	
	save: function() {
		var self = this;
		var msg = this.model.isNew() ? 'Successfully created' : 'Saved'
	},
	
	render: function() {
		var business_card = this.model.attributes.business_card;
		var business_card_information = business_card.business_card_information;
		var out = '<h2>Basic Information</h2> \
		<div class="vanilla_region"> \
			<div class="white_region"> \
				<div class="beige_region"> \
    			<div class="form_row"> \
		      	<label for="business_card_title">Title</label> \
		      	<input class="textbox" name="business_card_title" size="30" value="' + business_card.title + '" type="text" /> \
		    	</div> \
		      <div class="form_row"> \
		        <label for="business_card_business_card_information_attributes_name">Name</label> \
		        <input class="textbox" name="business_card_information_name" size="30" value="' + business_card_information.name + '" type="text" /> \
		      </div> \
		      <div class="form_row"> \
		        <label>Business card title</label> \
		        <input class="textbox" name="business_card_information_title" size="30" value="' + business_card_information.title + '" type="text" /> \
		      </div> \
		      <h2>Contact Information <span class="concern" id="order_contact_information">order</span></h2> \
		      <div class="form_row"> \
		        <label for="business_card_business_card_information_attributes_email">Email</label> \
		        <input class="textbox" name="business_card_information_email" size="30" value="' + business_card_information.email + '" type="text" /> \
		      </div> \
		      <div class="form_row"> \
		        <label for="business_card_business_card_information_attributes_website">Website</label> \
		        <input class="textbox" name="business_card_information_website" size="30" value="' + business_card_information.website + '" type="url" /> \
		      </div> \
		      <div class="form_row"> \
		        <label for="business_card_business_card_information_attributes_phone_number">Phone number</label> \
		        <input class="textbox" name="business_card_information_phone_number" size="30" value="' + business_card_information.phone_number + '" type="text" /> \
		      </div> \
		      <div class="form_row"> \
		        <label for="business_card_business_card_information_attributes_fax_number">Fax number</label> \
		        <input class="textbox" name="business_card_information_fax_number" size="30" value="' + business_card_information.fax_number + '" type="text" /> \
		      </div> \
		      <div class="form_row"> \
		        <label for="business_card_business_card_information_attributes_address">Address</label> \
		        <input class="textbox" name="business_card_information_address" size="30" value="' + business_card_information.address + '" type="text" /> \
		      </div> \
		      <input class="red_btn" id="business_card_submit" name="commit" value="Update" type="submit" /> \
					<a href="#" class="red_btn" id="business_card_submit">Cancel</a> \
				</div> \
			</div> \
		</div> \
			';
			
		$(this.el).html(out);
		$("#stage").html($(this.el))
	}
	
})