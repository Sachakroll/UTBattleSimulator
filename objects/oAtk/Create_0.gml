drawer = noone
enable_colors = false

collision_box = [
{x1:"", y1:"", x2:"", y2:""},
{x1:"", y1:"", x2:"", y2:""}]

atk_dmg = 0
life_timer = 0
life_time = -1 //-1 si durée de vie indéfinie
destructible = false

hsp = 0
vsp = 0

// Variables spécifiques à un type d'attaque

if type = "fire"
{
	amplitude = 14/40 + (1/40)*sin(2*pi*global.boss_turn_timer/150)
	phase_shift = (pi/2)*sin(2*pi*global.boss_turn_timer/240)
}
if type = "wall fire" {vsp = vert_speed}

function make_target_speed_unit_vector_towards_soul()
{
	var soul_dx = oSoul.x-x
	var soul_dy = oSoul.y-y
	var soul_dist = sqrt(sqr(soul_dx)+sqr(soul_dy))
	target_hsp = soul_dx/soul_dist
	target_vsp = soul_dy/soul_dist
}
if type = "hand fire"
{
	make_target_speed_unit_vector_towards_soul()
	hand_fire_timer = 0
	default_time_to_reach_target_speed = 30
	time_to_reach_target_speed = default_time_to_reach_target_speed
	default_life_time = 260
	life_time = default_life_time
}

if type = "blaster"
{
	image_speed = 0
	spawn_x = x
	spawn_y = y
}

// Autodestruction

function destroy_self()
{
	instance_destroy(drawer)
	instance_destroy()
	
	if type = "toriel hand"
	{
		if dir = 1 {oBattle.toriel_hand_left_inst = noone}
		if dir = -1 {oBattle.toriel_hand_right_inst = noone}
	}
}