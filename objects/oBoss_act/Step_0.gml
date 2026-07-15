if mouse_check_button_pressed(mb_left) && global.turn = "boss"
&& mouse_x >= x + 1 && mouse_x < x + sprite_width - 1
&& mouse_y >= y + 1 && mouse_y < y + sprite_height - 1
{
	global.selected_boss_action = action
}

image_index = (global.selected_boss_action = action) + 2*enable_colors*global.boss_atk_color
depth = global.base_button_depth - 2*(global.selected_boss_action = action)