App.Views.New = Backbone.View.extend({
	
	id: "new_business_card",
	
	events: {
		"submit form" : "save"
	},
	
	initialize: function() {
		this.render();
	},
	
	save: function() {
		var self = this;
		this.model.save(
			{	
				business_card : {
					title: this.$("[name=business_card_title]").val(), 
					url: this.$("[name=business_card_url]").val()
				}
			},
			{ 
				success: function(model, response) {
					
					if (response.success == 1) {
						self.model = model;

						self.delegateEvents();

						window.location.hash = '#';

						Backbone.history.saveLocation('business_cards/' + model.business_card.id)
					}
					else {
						new App.Views.Errors({errors: response.errors});
					}
				},
				error: function() {
					new App.Views.Error();
				}
			}
		);
		return false;
	},
	
	render: function() {
		
		var out = '<h1 id="form_header">Create Business Card</h1>';
		
		out += '<form> \
			<div id="business_card_form" class="vanilla_region"> \
		    <div class="white_region"> \
		      <div class="beige_region"> \
		        <div class="form_row"> \
		          <label>Choose a url for your card</label> \
		          <input class="textbox" id="business_card_url" name="business_card_url" size="30" type="text" /> \
		        </div> \
		        <div class="form_row" style="margin-bottom: 10px;"> \
		          <label>Pick a title for your card</label> \
		          <input class="textbox" id="business_card_title" name="business_card_title" size="30" type="text" /> \
		        </div> \
		        <input class="red_btn" id="business_card_submit" name="commit" value="Create" type="submit" /> \
						<a href="#" class="red_btn">Cancel</a> \
		      </div> \
		    </div> \
		  </div> \
		</form>';
		
		$(this.el).html(out);
		$("#stage").html($(this.el))

	}
})