// HP

global.player_max_hp = 16 + 4*(global.player_lv)
if global.player_hp > global.player_max_hp {global.player_hp = global.player_max_hp}
if global.player_hp < 0 {global.player_hp = 0}

// Nom du boss

global.boss_name = boss_get_name(global.selected_boss)