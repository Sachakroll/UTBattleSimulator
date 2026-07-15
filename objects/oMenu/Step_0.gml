if oFade.fade_timer = -1 {

// Continuer

if pressed("z", 0) && global.menu_selected_option = 1
{
	oFade.fade(30, Battle)
	audio_play_sound(snd_select, 1, 0, 1)
}

// Sélection des options

var prev_opt = global.menu_selected_option

if global.menu_selected_option != 0 && pressed("u", 0) {global.menu_selected_option --
	audio_play_sound(snd_choice, 1, 0, 1)}
if global.menu_selected_option != 3 && pressed("d", 0) {global.menu_selected_option ++
	audio_play_sound(snd_choice, 1, 0, 1)}

if global.menu_selected_option = 1 && global.player_name = ""
{global.menu_selected_option += 1-prev_opt
	if global.menu_selected_option = 1 {global.menu_selected_option = 0}}

// Options

if global.menu_selected_option = 2 && pressed("z", 0)
{
	oFade.fade(8, Settings)
	audio_play_sound(snd_select, 1, 0, 1)
}
if global.menu_selected_option = 3 && pressed("z", 0)
{
	oFade.fade(8, Settings_gamepad)
	audio_play_sound(snd_select, 1, 0, 1)
}

// Nom du joueur

if keyboard_check_pressed(vk_anykey) && global.menu_selected_option = 0
{
	for (var i = 1 ; i <= 26 ; i++)
	{
		if keyboard_check_pressed(string_ord_at(alphabet, i))
		{
			var char = string_char_at(alphabet, i)
			if !keyboard_check(vk_shift) {char = string_lower(char)}
			audio_play_sound(snd_text, 1, 0, 1)
			if string_length(global.player_name) < 6
			{
				global.player_name += char
			}
			else
			{
				global.player_name = string_delete(global.player_name, -1, 1)
				global.player_name += char
			}
			break
		}
	}
	if keyboard_check_pressed(vk_backspace) && string_length(global.player_name) > 0
	{global.player_name = string_delete(global.player_name, -1, 1)
		audio_play_sound(snd_text, 1, 0, 1)}
}

}

if string_upper(global.player_name) = "GASTER" {game_end()}