if mouse_check_button_pressed(mb_left) && global.turn = "boss"
&& mouse_x >= x + 1 && mouse_x < x + sprite_width - 1
&& mouse_y >= y && mouse_y < y + sprite_height - 1
{
	global.boss_atk_color ++
	if global.boss_atk_color >= global.boss_atk_colors_count {global.boss_atk_color = 0}
}

image_index = global.boss_atk_color