// Initialisation des variables

wall_dist = 7
hsp = 0
vsp = 0

collision_tolerance = 0
down_collision_tolerance = 1
dmg_invulnerability_time = 120
dmg_timer = dmg_invulnerability_time
dmg_flickering_period = 12 //nombre pair

// Âme bleue

jump_max_dur = 18
jump_timer = 0
jumping = false
jump_v = 1.42
gravity_speed = 0
gravity_dir = "down"
old_gravity_dir = gravity_dir

wall_slam = false
wall_slam_gravity_acc = 0.6
gravity_acc = 0.0791015625
smaller_gravity_acc = 0.035

function button_jump_pressed()
{
	switch gravity_dir
	{
		case "down" : return pressed("u", 0)
		case "up" : return pressed("d", 0)
		case "left" : return pressed("r", 0)
		case "right" : return pressed("l", 0)
	}
}
function button_jump_not_pressed()
{
	switch gravity_dir
	{
		case "down" : return !pressed("u", 1)
		case "up" : return !pressed("d", 1)
		case "left" : return !pressed("r", 1)
		case "right" : return !pressed("l", 1)
	}
}
function soul_is_on_ground(_x, _y, tolerance)
{
	return (gravity_dir = "down" && _y + vsp >= oBattle.box_bottom - wall_dist - tolerance)
	|| (gravity_dir = "up" && _y + vsp <= oBattle.box_bottom-oBattle.box_height + wall_dist + tolerance)
	|| (gravity_dir = "left" && _x + hsp <= 160-oBattle.box_width/2 + wall_dist + tolerance)
	|| (gravity_dir = "right" && _x + hsp >= 160+oBattle.box_width/2 - wall_dist - tolerance)
}
function switch_gravity_speed(old_dir, new_dir)
{
	if old_dir = "down" || old_dir = "up"
	{
		if new_dir = "up" || new_dir = "down" {return -gravity_speed}
		if new_dir = "right" {return hsp}
		if new_dir = "left" {return -hsp}
	}
	if old_dir = "left" || old_dir = "right"
	{
		if new_dir = "right" || new_dir = "left" {return -gravity_speed}
		if new_dir = "down" {return vsp}
		if new_dir = "up" {return -vsp}
	}
}

// Dégats et collisions

function damage_soul(dealt_dmg, eventual_object_to_destroy)
{
	if dmg_timer > dmg_invulnerability_time
	{
		global.player_hp -= dealt_dmg
		audio_play_sound(snd_dmg, 12, 0, 1)
		dmg_timer = 0
		if eventual_object_to_destroy != noone
		{eventual_object_to_destroy.destroy_self()}
		
		if global.player_hp <= 0 && global.boss_name = "Toriel" {oBoss.image_index = 1}
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