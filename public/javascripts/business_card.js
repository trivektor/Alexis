$(function(){
	
	var profile_leaf = $("#profile_leaf")
	
	$("#profile").hoverIntent(
		function(){ profile_leaf.slideToggle() },
		function(){ profile_leaf.slideToggle() }
	)
})