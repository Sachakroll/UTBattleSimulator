if !instance_exists(owner) {instance_destroy()}
else {

if owner.type = "bone hor"
{
	var _x = owner.x
	var _y = owner.y
	var sw = sprite_get_width(sAtk_bone_hor)
	var sh = sprite_get_height(sAtk_bone_hor)
	
	var surf_x = 160-oBattle.box_width/2
	var surf_y = oBattle.box_bottom-oBattle.box_height
	
	surface_set_target(global.surface)
	
	if owner.base = "bottom"
	{
		var h = 1 + oBattle.box_bottom - _y - sh
		draw_sprite_ext(sAtk_bone_hor, 0, _x-surf_x, _y-surf_y, 1, 1, 0, color, 1)
		draw_rectangle_colour(_x-2-surf_x, _y-surf_y, _x+3-surf_x, _y+h-surf_y, color, color, color, color, 0)
		draw_sprite_ext(sAtk_bone_hor, 1, _x-surf_x, _y+h-surf_y, 1, 1, 0, color, 1)
	}
	if owner.base = "top"
	{
		var h = 1 + _y - (oBattle.box_bottom-oBattle.box_height) - sh
		draw_sprite_ext(sAtk_bone_hor, 1, _x-surf_x, _y-surf_y, 1, 1, 0, color, 1)
		draw_rectangle_colour(_x-2-surf_x, _y-surf_y, _x+3-surf_x, _y-h-surf_y, color, color, color, color, 0)
		draw_sprite_ext(sAtk_bone_hor, 0, _x-surf_x, _y-h-surf_y, 1, 1, 0, color, 1)
	}
	
	surface_reset_target()
	draw_surface(global.surface, surf_x, surf_y)
}

if owner.type = "bone vert"
{
	var _x = owner.x
	var _y = owner.y
	var sw = sprite_get_width(sAtk_bone_vert)
	var sh = sprite_get_height(sAtk_bone_vert)
	
	var surf_x = 160-oBattle.box_width/2
	var surf_y = oBattle.box_bottom-oBattle.box_height
	
	surface_set_target(global.surface)
	
	if owner.base = "right"
	{
		var h = 1 + (160+oBattle.box_width/2) - _x - sw
		draw_sprite_ext(sAtk_bone_vert, 1, _x-surf_x, _y-surf_y, 1, 1, 0, color, 1)
		draw_rectangle_colour(_x-surf_x, _y-2-surf_y, _x+h-surf_x, _y+3-surf_y, color, color, color, color, 0)
		draw_sprite_ext(sAtk_bone_vert, 0, _x+h-surf_x, _y-surf_y, 1, 1, 0, color, 1)
	}
	if owner.base = "left"
	{
		var h = 1 - (160-oBattle.box_width/2) + _x - sw
		draw_sprite_ext(sAtk_bone_vert, 0, _x-surf_x, _y-surf_y, 1, 1, 0, color, 1)
		draw_rectangle_colour(_x-surf_x, _y-2-surf_y, _x-h-surf_x, _y+3-surf_y, color, color, color, color, 0)
		draw_sprite_ext(sAtk_bone_vert, 1, _x-h-surf_x, _y-surf_y, 1, 1, 0, color, 1)
	}
	
	surface_reset_target()
	draw_surface(global.surface, surf_x, surf_y)
}

// Debug

if global.debug
{draw_rectangle_colour(owner.collision_x1, owner.collision_y1, owner.collision_x2, owner.collision_y2, c_red, c_red, c_red, c_red, 0)}

}