drawer = noone
enable_colors = false

collision_x1 = 0
collision_y1 = 0
collision_x2 = 0
collision_y2 = 0

atk_dmg = 0
life_timer = 0
life_time = -1 //-1 si durée de vie indéfinie

hsp = 0
vsp = 0

// Variables spécifiques à un type d'attaque

if type = "fire"
{
	amplitude = 14/40 + (1/40)*sin(2*pi*global.boss_turn_timer/150)
	phase_shift = (pi/2)*sin(2*pi*global.boss_turn_timer/240)
}
if type = "wall fire" {vsp = vert_speed}

// Autodestruction

function destroy_self()
{
	instance_destroy(drawer)
	instance_destroy()
}