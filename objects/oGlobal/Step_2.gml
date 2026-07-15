// HP

if global.player_hp > global.player_max_hp {global.player_hp = global.player_max_hp}
if global.player_hp < 0 {global.player_hp = 0}

// Debug

if keyboard_check_pressed(221) {global.debug = 1 - global.debug}

// Manette

global.prev_input_l = pressed("l", 1)
global.prev_input_r = pressed("r", 1)
global.prev_input_u = pressed("u", 1)
global.prev_input_d = pressed("d", 1)