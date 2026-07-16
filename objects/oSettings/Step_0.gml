if oFade.fade_timer = -1 {

// Sélection des options

if selected_option != 0 && pressed("u", 0) {selected_option --
	audio_play_sound(snd_choice, 1, 0, 1)}
if selected_option != 7 && pressed("d", 0) {selected_option ++
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

if selected_option = 3
{
	if pressed("r", 0) && global.player_items < global.player_max_items {global.player_items ++
		if pressed("r", 0) {audio_play_sound(snd_choice, 1, 0, 1)}}
	if pressed("l", 0) && global.player_items > 0 {global.player_items --
		if pressed("l", 0) {audio_play_sound(snd_choice, 1, 0, 1)}}
	if pressed("z", 0)
	{
		if global.player_items < global.player_max_items {global.player_items = global.player_max_items}
		else {global.player_items = 0}
		audio_play_sound(snd_choice, 1, 0, 1)
	}
}

if selected_option = 4
{
	if pressed("r", 1) && global.boss_max_hp < 9999 {global.boss_max_hp += 10
		if global.boss_max_hp = 11 {global.boss_max_hp = 10}
		if global.boss_max_hp = 10000 {global.boss_max_hp = 9999}
		if pressed("r", 0) {audio_play_sound(snd_choice, 1, 0, 1)}}
	if pressed("l", 1) && global.boss_max_hp > 1 {global.boss_max_hp -= 10
		if global.boss_max_hp = 0 {global.boss_max_hp = 1}
		if global.boss_max_hp = 9989 {global.boss_max_hp = 9990}
		if pressed("l", 0) {audio_play_sound(snd_choice, 1, 0, 1)}}
	if pressed("z", 0)
	{
		if global.boss_max_hp < 9999 {global.boss_max_hp = 9999}
		else {global.boss_max_hp = 1}
		audio_play_sound(snd_choice, 1, 0, 1)
	}
}

if selected_option = 5
{
	if pressed("r", 1) && global.boss_turn_seconds < max_turn_dur {global.boss_turn_seconds ++
		if pressed("r", 0) {audio_play_sound(snd_choice, 1, 0, 1)}}
	if pressed("l", 1) && global.boss_turn_seconds > 1 {global.boss_turn_seconds --
		if pressed("l", 0) {audio_play_sound(snd_choice, 1, 0, 1)}}
	if pressed("z", 0)
	{
		if global.boss_turn_seconds < max_turn_dur {global.boss_turn_seconds = max_turn_dur}
		else {global.boss_turn_seconds = 1}
		audio_play_sound(snd_choice, 1, 0, 1)
	}
}

if selected_option = 6
{
	if pressed("r", 1) && global.volume < 1 {global.volume += 0.01
		if pressed("r", 0) {audio_play_sound(snd_choice, 1, 0, 1)}}
	if pressed("l", 1) && global.volume > 0 {global.volume -= 0.01
		if pressed("l", 0) {audio_play_sound(snd_choice, 1, 0, 1)}}
	if pressed("z", 0)
	{
		if global.volume < 1 {global.volume = 1}
		else {global.volume = 0}
		audio_play_sound(snd_choice, 1, 0, 1)
	}
}

if selected_option = 7 && (pressed("r", 0) || pressed("l", 0) || pressed("z", 0))
{
	global.enable_music = 1 - global.enable_music
	audio_play_sound(snd_choice, 1, 0, 1)
}

}

if global.enable_music
{
	switch global.fights_won
	{
		case 0: global.music = mus_menu0 ; break
		case 1: global.music = mus_menu1 ; break
		case 2: global.music = mus_menu2 ; break
		case 3: global.music = mus_menu3 ; break
		case 4: global.music = mus_menu4 ; break
		case 5: global.music = mus_menu5 ; break
		default: global.music = mus_menu6 ; break
	}
}
else {global.music = -1}