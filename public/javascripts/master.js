var Theme = {
	
	init : function() {
		this.setup_selectors();
		this.open_theme_gallery();
		this.close_theme_gallery();
	},
	
	setup_selectors : function() {
		this.select_theme_btn = $("#select_theme")
		this.theme_gallery = $("#theme_gallery")
		this.close_theme_gallery_btn = $("#close_theme_gallery")
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
	}
	
}

$(function() {
	
	Theme.init();
	
	$(".tooltip").tooltip({
		showURL: false,
		track: true,
		delay: 0,
		left: -40,
		top: 20
	})
	
})