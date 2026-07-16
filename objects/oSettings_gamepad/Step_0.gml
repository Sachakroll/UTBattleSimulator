if configurating
{
	sinceconfig_timer = 0
	if keyboard_check_pressed(vk_escape) || !global.gamepad_detected {configurating = false
		sinceconfig_timer = donemessage_time+1}
	
	if config_step = 3
	{
		for (var i = 0 ; i < gamepad_axis_count(global.gamepad) ; i++)
		{if abs(gamepad_axis_value(global.gamepad, i)) > global.gamepad_deadzone && global.gamepad_maps._h != i
			{configurating = false
				global.gamepad_maps._v = int64(i)
				if gamepad_axis_value(global.gamepad, i) < 0 {global.gamepad_maps.inv_v = false}
				if gamepad_axis_value(global.gamepad, i) > 0 {global.gamepad_maps.inv_v = true}
				audio_play_sound(snd_done, 1, 0, 1)
				
				var _string = json_stringify(global.gamepad_maps)
				var _file = file_text_open_write(gamepad_get_description(global.gamepad)+".txt")
				file_text_write_string(_file, _string)
				file_text_close(_file)
				
				global.config_done = true
				
				break}}
	}
	if config_step = 2
	{
		for (var i = 0 ; i < gamepad_axis_count(global.gamepad) ; i++)
		{if abs(gamepad_axis_value(global.gamepad, i)) > global.gamepad_deadzone
			{config_step ++
				global.gamepad_maps._h = int64(i)
				audio_play_sound(snd_bell, 1, 0, 1)
				break}}
	}
	if config_step = 1
	{
		for (var i = 0 ; i < gamepad_button_count(global.gamepad) ; i++)
		{if gamepad_button_check_pressed(global.gamepad, i)
			{config_step ++
				global.gamepad_maps._x = int64(i)
				audio_play_sound(snd_bell, 1, 0, 1)
				break}}
	}
	if config_step = 0
	{
		for (var i = 0 ; i < gamepad_button_count(global.gamepad) ; i++)
		{if gamepad_button_check_pressed(global.gamepad, i)
			{config_step ++
				global.gamepad_maps._z = int64(i)
				audio_play_sound(snd_bell, 1, 0, 1)
				break}}
	}
}

if !configurating && sinceconfig_timer != 0
{
	config_step = 0
	
	// Sélection des options
	if pressed("u", 0) || pressed("d", 0) {selected_option = 1 - selected_option
		audio_play_sound(snd_choice, 1, 0, 1)}
	if !global.gamepad_detected {selected_option = 0
		sinceconfig_timer = donemessage_time+1}

	if selected_option = 1 && pressed("z", 0) {configurating = true
		audio_play_sound(snd_select, 1, 0, 1)}

	// Retour au menu
	if (keyboard_check_pressed(vk_escape) || (pressed("x", 0) && !pressed("z", 0))
	|| ((selected_option = 0) && pressed("z", 0))) && oFade.fade_timer = -1
	{
		sinceconfig_timer = donemessage_time+1
		oFade.fade(8, Menu)
		audio_play_sound(snd_select, 1, 0, 1)
	}
}

sinceconfig_timer ++