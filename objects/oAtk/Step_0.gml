if type = "bone hor"
{
	x += dir
	
	atk_dmg = 3
	enable_colors = true
	collision_box[0].x1 = x - 2
	collision_box[0].x2 = x + 3
	
	if base = "bottom"
	{
		collision_box[0].y1 = y - sprite_get_height(sAtk_bone_hor_papyrus)/2 + 1
		collision_box[0].y2 = oBattle.box_bottom
	}
	if base = "top"
	{
		collision_box[0].y1 = oBattle.box_bottom - oBattle.box_height
		collision_box[0].y2 = y + sprite_get_height(sAtk_bone_hor_papyrus)/2 - 1
		if y < oBattle.box_bottom-oBattle.box_height - 8
		{destroy_self()}
	}
	if x < 160-(oBattle.box_width/2)-10 || x > 160+(oBattle.box_width/2)+10
	{destroy_self()}
}

if type = "bone vert"
{
	y += dir
	
	atk_dmg = 3
	enable_colors = true
	collision_box[0].y1 = y - 2
	collision_box[0].y2 = y + 3
	
	if base = "right"
	{
		collision_box[0].x1 = x - sprite_get_width(sAtk_bone_hor_papyrus)/2 + 1
		collision_box[0].x2 = 160+(oBattle.box_width/2)
	}
	if base = "left"
	{
		collision_box[0].x1 = 160-(oBattle.box_width/2)
		collision_box[0].x2 = x + sprite_get_width(sAtk_bone_hor_papyrus)/2 - 1
	}
	if y < oBattle.box_bottom-oBattle.box_height - 10 || y > oBattle.box_bottom + 10
	{destroy_self()}
}

if type = "fire"
{
	var mov_period = 22 * sqrt(oBattle.box_width/oBattle.box_default_width)
	var ground_coll_margin = 7
	
	if vsp = 0 {vsp = 0.2}
	vsp += 0.016
	if y + vsp >= oBattle.box_bottom-ground_coll_margin
	{vsp = 0
		y = oBattle.box_bottom-ground_coll_margin}
	hsp = dir*amplitude*(oBattle.box_width/2)*cos((life_timer/mov_period)-phase_shift)/mov_period + sign(hsp)/8
}
if type = "wall fire" {x = 160+wall_side*oBattle.box_width/2-wall_side*8}
if type = "fire" || type = "wall fire"
{
	x += hsp
	y += vsp
	
	atk_dmg = 4
	enable_colors = false
	collision_box[0].x1 = x-3
	collision_box[0].y1 = y-3
	collision_box[0].x2 = x+3
	collision_box[0].y2 = y+3
	life_time = 300
	
	if y < oBattle.box_bottom-oBattle.box_height - 10 || y > oBattle.box_bottom + 10
	{destroy_self()}
}

if type = "toriel hand"
{
	if hsp = 0 {hsp = dir*0.71}
	var cos_coeff = pi*dir/(oBattle.box_width)
	vsp = 16*cos(cos_coeff*life_timer)*cos_coeff
	hsp += dir*0.0185
	
	var drop_interval = 8
	if (life_timer-2) mod drop_interval = drop_interval-1 && life_timer > drop_interval
	{
		instance_create_layer(x, y, "Bullets", oAtk, {type : "hand fire", dir : 1, hand_id : id})
		if dir = 1 || oBattle.toriel_hand_left_inst = noone 
		{audio_play_sound(snd_place, 1, 0, 0.7)}
	}
	
	x += hsp
	y += vsp
	
	collision_box[0].x1 = x-13 + 4*(dir=-1)
	collision_box[0].y1 = y-9 + 2*(dir=-1)
	collision_box[0].x2 = x + 2*(dir=-1)
	collision_box[0].y2 = y-5 + 2*(dir=-1)
	collision_box[1].x1 = x-4 + 3*(dir=-1)
	collision_box[1].y1 = y
	collision_box[1].x2 = x+8 + 2*(dir=-1)
	collision_box[1].y2 = y+4 + 4*(dir=-1)
	
	atk_dmg = 4
	enable_colors = false
	destructible = true
	
	if x < 160-(oBattle.box_width/2)-15 || x > 160+(oBattle.box_width/2)+15
	{destroy_self()}
}

if type = "hand fire"
{
	if instance_exists(hand_id)
	{
		var target_speed_norm = 1.2
		var target_speed_increase_exponent = 1/2.5
		make_target_speed_unit_vector_towards_soul()
		target_hsp *= target_speed_norm
		target_vsp *= target_speed_norm
		if oBattle.box_width > oBattle.box_default_width
		{
			target_hsp *= power(oBattle.box_width/oBattle.box_default_width, target_speed_increase_exponent)
			time_to_reach_target_speed = sqrt(oBattle.box_width/oBattle.box_default_width)*default_time_to_reach_target_speed
			life_time = default_life_time*power(oBattle.box_width/oBattle.box_default_width, 1/4)
		}
		if oBattle.box_height > oBattle.box_default_height
		{
			target_vsp *= power(oBattle.box_height/oBattle.box_default_height, target_speed_increase_exponent)
			time_to_reach_target_speed = sqrt(oBattle.box_width/oBattle.box_default_width)*default_time_to_reach_target_speed
			life_time = default_life_time*power(oBattle.box_width/oBattle.box_default_width, 1/4)
		}
	}
	else
	{
		hand_id = noone
		hand_fire_timer ++
		var box_collision_dist = 6
		
		if hand_fire_timer <= time_to_reach_target_speed
		{
			if abs(hsp) < abs(target_hsp) {hsp += target_hsp/time_to_reach_target_speed}
			else {hsp = target_hsp}
			if abs(vsp) < abs(target_vsp) {vsp += target_vsp/time_to_reach_target_speed}
			else {vsp = target_vsp}
		}
		
		if x + hsp >= 160+(oBattle.box_width/2)-box_collision_dist
		|| x + hsp <= 160-(oBattle.box_width/2)+box_collision_dist
		{hsp = -hsp}
		if y + vsp >= oBattle.box_bottom-box_collision_dist
		|| y + vsp <= oBattle.box_bottom-oBattle.box_height+box_collision_dist
		{vsp = -vsp}
		
		if x + hsp >= 160+(oBattle.box_width/2)-box_collision_dist {hsp -= 0.44}
		if x + hsp <= 160-(oBattle.box_width/2)+box_collision_dist {hsp += 0.44}
		
		x += hsp
		y += vsp
		
		if life_timer > life_time-60
		{
			var deceleration = 0.013
			hsp -= sign(hsp)*deceleration
			vsp -= sign(vsp)*deceleration
		}
	}
	
	atk_dmg = 3
	enable_colors = false
	collision_box[0].x1 = x-3
	collision_box[0].y1 = y-3
	collision_box[0].x2 = x+3
	collision_box[0].y2 = y+3
	
	if x < 160-(oBattle.box_width/2) || x > 160+(oBattle.box_width/2)
	{destroy_self()}
}

if type = "blaster"
{
	sprite_index = sBlaster
	image_angle = angle + 90
	image_xscale = scale
	
	atk_dmg = 0
	enable_colors = false
	
	if (x != target_x || y != target_y) && life_timer < blast_time
	{
		var decc = 1/6
		if life_timer > 25 {decc = 1/3}
		hsp = (target_x-x)*decc
		vsp = (target_y-y)*decc
		
		x += hsp
		y += vsp
		
		if abs(target_x-x) <= 1 {x = target_x}
		if abs(target_y-y) <= 1 {y = target_y}
	}
	
	if life_timer = 10 {audio_play_sound(snd_blast1, 1, 0, 0.6, 0, 1.2)}
	if life_timer = 30 {image_speed = 1}
	if image_index >= 5 {image_speed = 0}
	if life_timer = blast_time
	{
		hsp = 0
		vsp = 0
		var target_dist = point_distance(x, y, spawn_x, spawn_y)
		h_acc = (spawn_x-x)/target_dist
		v_acc = (spawn_y-y)/target_dist
		
		audio_play_sound(snd_blast2, 1, 0, 0.6)
	}
	
	if life_timer > blast_time
	{		
		if life_timer <= blast_max_time
		{blast_width = blast_max_width * (life_timer-blast_time)/(blast_max_time-blast_time)}
		else
		{
			if life_timer <= blast_end_time
			{blast_width = blast_max_width * (1 - (life_timer-blast_max_time)/(blast_end_time-blast_max_time))}
			else
			{
				blast_width = 0
				atk_dmg = 0
			}
		}
	}
	
	if life_timer > blast_max_time
	{
		hsp += h_acc
		vsp += v_acc
		x += hsp
		y += vsp
	}
	if x > 620 || x < -300 || y > 540 || y < -300 {destroy_self()}
	show_debug_message(image_angle)
}

// Créer l'objet qui dessine l'attaque (pour certaines attaques)

if !instance_exists(drawer) && !is_this_instance_dead
// Types d'attaques qui ont besoin d'un drawer :
&& (type = "bone hor" || type = "bone vert" || type = "fire" || type = "wall fire" || type = "toriel hand" || type = "hand fire" || type = "blaster")
{
	if enable_colors
	{
		var draw_colr = c_white
		if color = 1 {draw_colr = make_colour_rgb(0, 162, 232)}
		if color = 2 {draw_colr = make_colour_rgb(255, 159, 41)}
		drawer = instance_create_layer(x, y, "Bullets", oAtk_drawer, {owner : id, color : draw_colr})
	}
	else {drawer = instance_create_layer(x, y, "Bullets", oAtk_drawer, {owner : id})}
}

// Destuction

if global.turn != "boss"
|| (life_time != -1 && life_timer >= life_time)
|| ((x > 420 || x < -100 || y > 340 || y < -100) && type != "blaster")
{destroy_self()}

life_timer ++