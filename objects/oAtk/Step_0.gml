if type = "bone hor"
{
	x += dir
	
	atk_dmg = 3
	enable_colors = true
	collision_x1 = x - 2
	collision_x2 = x + 3
	
	if base = "bottom"
	{
		collision_y1 = y - sprite_get_height(sAtk_bone_hor)/2 + 1
		collision_y2 = oBattle.box_bottom
	}
	if base = "top"
	{
		collision_y1 = oBattle.box_bottom - oBattle.box_height
		collision_y2 = y + sprite_get_height(sAtk_bone_hor)/2 - 1
		if y < oBattle.box_bottom-oBattle.box_height - 8
		{destroy_self()}
	}
	if x < 160-(oBattle.box_width/2)-10 || x > 160+(oBattle.box_width/2)+10
	{destroy_self()}
}

if type = "bone vert"
{
	x += dir
	
	atk_dmg = 3
	enable_colors = true
	collision_y1 = y - 2
	collision_y2 = y + 3
	
	if base = "right"
	{
		collision_x1 = x - sprite_get_width(sAtk_bone_hor)/2 + 1
		collision_x2 = 160+(oBattle.box_width/2)
	}
	if base = "left"
	{
		collision_x1 = 160-(oBattle.box_width/2)
		collision_x2 = x + sprite_get_width(sAtk_bone_hor)/2 - 1
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
	
	atk_dmg = 3
	enable_colors = false
	collision_x1 = x-3
	collision_y1 = y-3
	collision_x2 = x+3
	collision_y2 = y+3
	life_time = 300
	
	if y < oBattle.box_bottom-oBattle.box_height - 10 || y > oBattle.box_bottom + 10
	{destroy_self()}
}

// Créer l'objet qui dessine l'attaque (pour certaines attaques)

if !instance_exists(drawer)
// Types d'attaques qui ont besoin d'un drawer :
&& (type = "bone hor" || type = "bone vert" || type = "fire" || type = "wall fire")
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