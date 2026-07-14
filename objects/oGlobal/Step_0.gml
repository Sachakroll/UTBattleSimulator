// Lancement

if room = Launch
{
	launch_timer ++
	if launch_timer = launch_time || pressed("z", 0) {room_goto(Menu)}
}

// Plein écran

if keyboard_check_pressed(vk_f4) || keyboard_check_pressed(vk_f11)
{window_set_fullscreen(1-window_get_fullscreen())}

// Paramètres

global.atk_power = global.atk_strength

// Musique

if previous_music != global.music
{
	if previous_music != -1 {audio_stop_sound(previous_music)}
	if global.music != -1 {audio_play_sound(global.music, 0, 1)}
}
previous_music = global.music

if !global.enable_music {global.music = -1}

if global.music != - 1
{
	var a_gain = 1
	if room = Battle {a_gain = global.ubervolume*oBoss.image_alpha}
	else {a_gain = global.ubervolume}
	audio_sound_gain(global.music, a_gain)
}

audio_master_gain(global.volume)

// Nom du boss

global.boss_name = boss_get_name(global.selected_boss)