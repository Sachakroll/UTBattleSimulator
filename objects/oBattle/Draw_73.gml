// Dessiner les attaques

draw_surface(global.surface, 160-oBattle.box_width/2, oBattle.box_bottom-oBattle.box_height)

// Boite de dialogue par dessus les attaques

if do_render_box && global.turn != "death" && global.turn != "flee" && global.turn != "player" && oFade.image_alpha = 0
{
	draw_sprite_stretched(sDialog_box_transp, 0, 160-(box_width/2), box_bottom-box_height, box_width, box_height)
}

// Debug

if global.debug
{
	global.debug_render_smaller_text = true
	var interline = 7
	var bx = 224
	var by = 32
	
	print("Debug mode", bx, by, c_red)
	print("T: "+global.turn, bx+12, by+interline, c_red)
	print("B: "+string(global.selected_boss_action), bx+12, by+interline*2, c_red)
	print("I: "+string(instance_count), bx+56, by, c_red)
	
	global.debug_render_smaller_text = false
}