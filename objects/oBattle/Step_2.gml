// Debug

if keyboard_check(ord("A")) {global.player_hp ++}
if keyboard_check(ord("Q")) {global.player_hp --}

show_debug_message("Turn : "+global.turn)
show_debug_message("Instances : "+string(instance_count))