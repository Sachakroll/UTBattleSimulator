if global.turn != "end" && global.turn != "flee" && oBattle.boss_atk_cooldown = 0
&& mouse_x >= x + 1 && mouse_x < x + sprite_width - 1
&& mouse_y >= y && mouse_y < y + sprite_height - 1
{
	if mouse_check_button_pressed(mb_left)
	{
		audio_play_sound(snd_bell, 1, 0, 1)
		global.soulmode ++
	}
	if mouse_check_button_pressed(mb_right)
	{
		audio_play_sound(snd_bell, 1, 0, 1)
		global.soulmode --
	}
	if global.soulmode >= global.soulmodes_count {global.soulmode = 0}
	if global.soulmode < 0 {global.soulmode = global.soulmodes_count-1}
}

image_index = global.soulmode