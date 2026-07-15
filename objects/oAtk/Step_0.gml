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
		{
			instance_destroy(drawer)
			instance_destroy()
		}
	}
	if x < 160-(oBattle.box_width/2)-10 || x > 160+(oBattle.box_width/2)+10
	{
		instance_destroy(drawer)
		instance_destroy()
	}
}

if type = "bone vert"
{
	y += dir
	
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
	{
		instance_destroy(drawer)
		instance_destroy()
	}
}

// Dessiner

if !instance_exists(drawer)
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

if global.turn = "player"
{
	instance_destroy(drawer)
	instance_destroy()
}