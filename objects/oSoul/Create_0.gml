wall_dist = 7
gravity_speed = 0
input_vsp = 0
hsp = 0
vsp = 0

jump_max_dur = 18
jump_timer = 0
jumping = false
jump_v = 1.42
gravity_acc = 0.0791015625

collision_tolerance = 0
down_collision_tolerance = 1
dmg_invulnerability_time = 120
dmg_timer = dmg_invulnerability_time
dmg_flickering_period = 12 // nombre pair

function damage_soul(dealt_dmg, eventual_object_to_destroy)
{
	if dmg_timer > dmg_invulnerability_time
	{
		global.player_hp -= dealt_dmg
		audio_play_sound(snd_dmg, 12, 0, 1)
		dmg_timer = 0
		if eventual_object_to_destroy != noone
		{eventual_object_to_destroy.destroy_self()}
	}
}

function detect_straight_collision(box)
{
	return (x + 5-collision_tolerance > box.x1
	&& x - 4+collision_tolerance < box.x2
	&& y + 5-down_collision_tolerance > box.y1
	&& y - 4+collision_tolerance < box.y2)
}

function detect_collision(box)
{
	if box.rot = "" {return detect_straight_collision(box)}
		
	var inst = instance_create_layer(0, 0, "Bullets", oRotatable_collision_box)
	var collision = inst.calculate_collision(box)
	//if !global.debug {instance_destroy(inst)}
	return collision
}