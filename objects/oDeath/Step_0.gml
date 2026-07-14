if oFade.fade_timer = -1 {
	
if keyboard_check_pressed(vk_escape) {oFade.fade(36, Menu)}

if dialog_index = 2 && pressed("z", 0)
{
	oFade.fade(72, Menu)
}

if pressed("z", 0) && array_equals(rendered_characters, [string_length(dialog[0]), string_length(dialog[1]), string_length(dialog[2])])
{
	rendered_characters = [0, 0, 0]
	if dialog_index = 1
	{
		dialog = ["", "", ""]
		dialog_index = 2
	}
	if dialog_index = 0
	{
		dialog = death_dialog(2)
		dialog_index = 1
	}
}

}

if death_timer = death_time_soulbreak
{
	oDeath_soul.sprite_index = sSoul_break
	audio_play_sound(snd_soulbreak, 20, 0, 1)
}

if death_timer = death_time_soulfragment
{
	instance_destroy(oDeath_soul)
	audio_play_sound(snd_soulfragment, 20, 0, 1)
	for (i = 0 ; i < 6 ; i++)
	{
		instance_create_layer(global.death_soul_x + random_range(-6, 6), 
		global.death_soul_y + random_range(-6, 6), "Instances", oSoul_fragment)
	}
}

if death_timer = death_time_gameover {global.music = mus_gameover}

death_timer ++

// Défilement des dialogues

alternating_timer = 1 - alternating_timer
mouth_timer ++
if mouth_timer = 4 {mouth_timer = 0}