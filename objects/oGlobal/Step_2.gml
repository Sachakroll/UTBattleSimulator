// HP

global.player_max_hp = 16 + 4*(global.player_lv)
if global.player_hp > global.player_max_hp {global.player_hp = global.player_max_hp}
if global.player_hp < 0 {global.player_hp = 0}

// Debug

if keyboard_check_pressed(221) {global.debug = 1 - global.debug}
if global.debug
{
	if keyboard_check_pressed(vk_f1) {
		if room != Battle {room_goto(Battle)}
		else {room_goto(Menu)}}
	if keyboard_check_pressed(vk_f2) {global.enable_music = !global.enable_music}
	if keyboard_check_pressed(vk_f3) {global.turn = "boss"}
}

// Manette

global.prev_input_l = pressed("l", 1)
global.prev_input_r = pressed("r", 1)
global.prev_input_u = pressed("u", 1)
global.prev_input_d = pressed("d", 1)