if mouse_check_button_pressed(mb_left)
&& mouse_x >= x && mouse_x < x+sprite_width-2
&& mouse_y >= y && mouse_y < y+sprite_height
{
	global.enable_music = 1 - global.enable_music
}

image_index = global.enable_music