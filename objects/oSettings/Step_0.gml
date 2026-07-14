if oFade.fade_timer = -1 {

// Sélection des options

if selected_option != 0 && pressed("u", 0) {selected_option --
	audio_play_sound(snd_choice, 1, 0, 1)}
if selected_option != 2 && pressed("d", 0) {selected_option ++
	audio_play_sound(snd_choice, 1, 0, 1)}

// Retour au menu

if keyboard_check_pressed(vk_escape) || pressed("x", 0) 
|| ((selected_option = 0) && pressed("z", 0))
{
	oFade.fade(8, Menu)
	audio_play_sound(snd_select, 1, 0, 1)
}

// Options

if selected_option = 1
{
	if pressed("r", 0) && global.player_lv < 20 {global.player_lv ++
		audio_play_sound(snd_choice, 1, 0, 1)}
	if pressed("l", 0) && global.player_lv > 1 {global.player_lv --
		audio_play_sound(snd_choice, 1, 0, 1)}
	if pressed("z", 0)
	{
		if global.player_lv < 20 {global.player_lv = 20}
		else {global.player_lv = 1}
		audio_play_sound(snd_choice, 1, 0, 1)
	}
}

if selected_option = 2
{
	if pressed("r", 1) && global.atk_strength < 100 {global.atk_strength ++
		if pressed("r", 0) {audio_play_sound(snd_choice, 1, 0, 1)}}
	if pressed("l", 1) && global.atk_strength > 1 {global.atk_strength --
		if pressed("l", 0) {audio_play_sound(snd_choice, 1, 0, 1)}}
	if pressed("z", 0)
	{
		if global.atk_strength < 100 {global.atk_strength = 100}
		else {global.atk_strength = 1}
		audio_play_sound(snd_choice, 1, 0, 1)
	}
}

}