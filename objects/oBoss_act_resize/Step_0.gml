if mouse_check_button_pressed(mb_left) && mouse_y > 0 && mouse_y < 25 - 1
{
	if mouse_x >= 0 && mouse_x <= 23 && global.turn = "boss" {global.selected_boss_action = "resize"}
	if mouse_x >= 24 && mouse_x <= 47 - 1
	{
		if global.turn = "boss" {
			oBattle.box_height = oBattle.box_default_height
			oBattle.box_width = oBattle.box_default_width}
		else {
			oBattle.box_target_height = oBattle.box_default_height
			oBattle.box_target_width = oBattle.box_default_width}
		audio_play_sound(snd_bell, 1, 0, 1)
	}
}

image_index = (global.selected_boss_action = "resize")

if global.selected_boss_action = "resize"
{depth = global.base_button_depth - 2}
else {depth = global.base_button_depth}