App.Views.Index = Backbone.View.extend({
	
	initialize: function() {
		this.business_cards = this.options.business_cards;
		this.render();
	},
	
	render: function() {
		var out = '';
		if (this.business_cards.length > 0) {
			out += '<ul class="item_list" id="mycards_list">';
				_(this.business_cards).each(function(item) {
					out += ' \
					<li class="clearfix"> \
	          <div class="left"> \
	            <a title="View this card (in a new tab)" href="/trivektor" class="card_name tooltip">' + item.attributes.business_card.title + '</a> \
	            <div class="card_last_updated">Last updated on ' + item.attributes.business_card.updated_at + '</div> \
	          </div> \
	          <div class="options"> \
	             <a title="Delete" href="#business_cards/' + item.attributes.business_card.id + '/delete" class="delete action_link tooltip"></a> \
	             <a title="View this card" class="viewlive action_link tooltip" href="/trivektor" target="_blank">trivektor</a> \
	             <a title="Edit this card" class="edit action_link tooltip" href="#business_cards/' + item.attributes.business_card.id + '">Edit</a> \
	             <a title="View stats" class="analytic action_link" href="/business_cards/2/stats">Analytics</a> \
	          </div> \
	        </li>';
				})
       
		} else {
			out += "<p style=\"margin-bottom:10px\">You don't have any cards</p>";
		}
		
		out += '</ul><a class="red_btn" href="#new">Create new card</a>'
		
		$(this.el).html(out)
		$("#stage").html('<h1>My cards</h1><div id="mycards" class="vanilla_region"><div class="white_region"><div class="beige_region">' + $(this.el).html() + '</div></div></div>')
	}
})