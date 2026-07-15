// Boite de dialogue par dessus les attaques

if do_render_box && global.turn != "death" && global.turn != "flee" && global.turn != "player"
{
	draw_sprite_stretched(sDialog_box_transp, 0, 160-(box_width/2), box_bottom-box_height, box_width, box_height)
}