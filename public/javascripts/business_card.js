$(function(){
	
	var profile_leaf = $("#profile_leaf")
	
	var config = {
		over: function(){ profile_leaf.slideToggle() },
		timeout: 500,
		out: function(){ profile_leaf.slideToggle() }
	}
	
	$("#profile").hoverIntent( config )
})