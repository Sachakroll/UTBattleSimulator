if mouse_check_button_pressed(mb_left) && global.turn != "end" && global.turn != "flee"
&& mouse_x >= x + 1 && mouse_x < x + sprite_width - 1
&& mouse_y >= y && mouse_y < y + sprite_height - 1
{
	audio_play_sound(snd_bell, 1, 0, 1)
	global.soulmode ++
	if global.soulmode >= global.soulmodes_count {global.soulmode = 0}
}

image_index = global.soulmode