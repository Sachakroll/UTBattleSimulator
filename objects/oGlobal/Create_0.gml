// Lancement

launch_timer = 0
launch_time = 120
audio_play_sound(snd_intro, 100, 0, 1)

// Initialisation de variables

global.selected_boss = 0
global.boss_name = boss_get_name(global.selected_boss)
global.bosses_nb = sprite_get_number(sBoss_tab)
global.player_name = ""

global.menu_selected_option = 0
global.fights_won = 0
global.debug = 0

global.death_soul_x = 0
global.death_soul_y = 0

// Settings

global.player_lv = 1
global.atk_strength = 20
global.inventory = ["", "", "", ""]
global.player_max_items = array_length(global.inventory)

global.boss_turn_seconds = 30
global.boss_max_hp = 1200

global.boss_turn_time = 60*global.boss_turn_seconds
global.player_max_hp = 16 + 4*(global.player_lv)
global.player_hp = global.player_max_hp
global.boss_hp = global.boss_max_hp
global.player_items = global.player_max_items

// Manette

global.gamepad_detected = false
global.gamepad = -1
global.gamepad_name = "error"
global.gamepad_maps = {
	_z : 1,
	_x : 2,
	_h : 3,
	_v : 4,
	inv_v : 0
}
global.gamepad_deadzone = 0.3

global.prev_input_l = 0
global.prev_input_r = 0
global.prev_input_u = 0
global.prev_input_d = 0

// Son et musique

global.music = -1
previous_music = -1
global.volume = 1
global.enable_music = 0
global.ubervolume = 1