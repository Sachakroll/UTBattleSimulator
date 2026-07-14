// HP

if global.player_hp > global.player_max_hp {global.player_hp = global.player_max_hp}
if global.player_hp < 0 {global.player_hp = 0}

// Debug

if keyboard_check_pressed(221) {global.debug = 1 - global.debug}