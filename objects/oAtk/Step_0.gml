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
	if hsp = 0 {hsp = dir*(3/5)}
	var cos_coeff = 2.1*pi*dir/(2*oBattle.box_width)
	vsp = 16*cos(cos_coeff*life_timer)*cos_coeff
	hsp += dir*0.016
	
	var drop_interval = 10
	if life_timer mod drop_interval = drop_interval-1 && life_timer > drop_interval
	{instance_create_layer(x, y, "Bullets", oAtk, {type : "hand fire", dir : 1, hand_id : id})}
	
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

// Créer l'objet qui dessine l'attaque (pour certaines attaques)

if !instance_exists(drawer)
// Types d'attaques qui ont besoin d'un drawer :
&& (type = "bone hor" || type = "bone vert" || type = "fire" || type = "wall fire" || type = "toriel hand" || type = "hand fire")
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
|| x > 420 || x < -100 || y > 340 || y < -100
{destroy_self()}

life_timer ++