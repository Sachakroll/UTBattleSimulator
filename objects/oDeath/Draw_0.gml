// Texte 'Game over'

if death_timer >= death_time_gameover
{
	var alf = (death_timer-death_time_gameover)/(death_time_gameover_appeared-death_time_gameover)
	draw_sprite_ext(sGameover, 0, 160, 18, 1, 1, 0, c_white, alf)
}

// Dialogue

if death_timer >= death_time_text
{
	var dlg_tab = [string_to_number_array(dialog[0]), string_to_number_array(dialog[1]), string_to_number_array(dialog[2])]
	for (var line = 0 ; line < 3 ; line++)
	{
		var rendered_text_length = 0
		if rendered_characters[line] != array_length(dlg_tab[line]) 
		&& (line = 0 || rendered_characters[0] = array_length(dlg_tab[0]))
		&& (line != 2 || (rendered_characters[0] = array_length(dlg_tab[0]) && rendered_characters[1] = array_length(dlg_tab[1])))
		{
			if mouth_timer = 0
			{array_set(rendered_characters, line, rendered_characters[line]+1)
				if dlg_tab[line][rendered_characters[line]-1] != 62
				{audio_play_sound(snd_text_asgore, 0, 0, 1)}}
		}
		for (var i = 0 ; i < rendered_characters[line] ; i++)
		{
			draw_sprite(sN_letters, dlg_tab[line][i], 80+rendered_text_length+(global.turn = "flee")*global.dialog_interline, 162+line*global.dialog_interline)
			rendered_text_length += n_font_spacing(dlg_tab[line][i]) + 2
		}
	}
}