if mouse_check_button_pressed(mb_left) && global.turn = "boss"
&& mouse_x >= x + 1 && mouse_x < x + sprite_width - 1
&& mouse_y >= y && mouse_y < y + sprite_height - 1
{
	audio_play_sound(snd_bell, 1, 0, 1)
	global.boss_turn_timer = global.boss_turn_time
}