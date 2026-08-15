if !instance_exists(owner) {instance_destroy()}
else {
	
var _x = owner.x
var _y = owner.y
var surf_x = 160-oBattle.box_width/2
var surf_y = oBattle.box_bottom-oBattle.box_height

surface_set_target(global.surface)

if owner.type = "bone hor"
{
	if !sprite_init
	{
		sprite = sAtk_bone_hor_papyrus
		if global.boss_name = "Sans" {sprite = sAtk_bone_hor_sans}
		sprite_init = true
	}
	
	var sw = sprite_get_width(sprite)
	var sh = sprite_get_height(sprite)
	
	if owner.base = "bottom"
	{
		var h = 1 + oBattle.box_bottom - _y - sh
		draw_sprite_ext(sprite, 0, _x-surf_x, _y-surf_y, 1, 1, 0, color, 1)
		draw_rectangle_colour(_x-2-surf_x, _y-surf_y, _x+3-surf_x, _y+h-surf_y, color, color, color, color, 0)
		draw_sprite_ext(sprite, 1, _x-surf_x, _y+h-surf_y, 1, 1, 0, color, 1)
	}
	if owner.base = "top"
	{
		var h = 1 + _y - (oBattle.box_bottom-oBattle.box_height) - sh
		draw_sprite_ext(sprite, 1, _x-surf_x, _y-surf_y, 1, 1, 0, color, 1)
		draw_rectangle_colour(_x-2-surf_x, _y-surf_y, _x+3-surf_x, _y-h-surf_y, color, color, color, color, 0)
		draw_sprite_ext(sprite, 0, _x-surf_x, _y-h-surf_y, 1, 1, 0, color, 1)
	}
}

if owner.type = "bone vert"
{
	if !sprite_init
	{
		sprite = sAtk_bone_vert_papyrus
		if global.boss_name = "Sans" {sprite = sAtk_bone_vert_sans}
		sprite_init = true
	}
	
	var sw = sprite_get_width(sprite)
	var sh = sprite_get_height(sprite)
	
	if owner.base = "right"
	{
		var h = 1 + (160+oBattle.box_width/2) - _x - sw
		draw_sprite_ext(sprite, 1, _x-surf_x, _y-surf_y, 1, 1, 0, color, 1)
		draw_rectangle_colour(_x-surf_x, _y-2-surf_y, _x+h-surf_x, _y+3-surf_y, color, color, color, color, 0)
		draw_sprite_ext(sprite, 0, _x+h-surf_x, _y-surf_y, 1, 1, 0, color, 1)
	}
	if owner.base = "left"
	{
		var h = 1 - (160-oBattle.box_width/2) + _x - sw
		draw_sprite_ext(sprite, 0, _x-surf_x, _y-surf_y, 1, 1, 0, color, 1)
		draw_rectangle_colour(_x-surf_x, _y-2-surf_y, _x-h-surf_x, _y+3-surf_y, color, color, color, color, 0)
		draw_sprite_ext(sprite, 1, _x-h-surf_x, _y-surf_y, 1, 1, 0, color, 1)
	}
}

if owner.type = "fire" || owner.type = "wall fire" || owner.type = "hand fire"
{
	var img = 0
	if timer mod 6 >= 3 {img = 1}
	draw_sprite(sAtk_fire, img, _x-surf_x, _y-surf_y)
}

if owner.type = "toriel hand"
{
	draw_sprite(sAtk_toriel_hand, (1-owner.dir)/2, _x-surf_x, _y-surf_y)
}

surface_reset_target()

if owner.type = "blaster"
{
	if timer > owner.blast_time
	{
		var angle = owner.angle
		var display_angle = owner.image_angle
		var draw_dist = owner.blast_dist
		var ray_width = owner.blast_width
		var threerectangles_draw_shift = 6
		var alpha = 1
		if timer > owner.blast_max_time {alpha = ray_width/owner.blast_max_width}
		
		ray_width *= owner.scale
		draw_blast(_x, _y, draw_dist, angle, display_angle, ray_width, 720, alpha)
		
		ray_width *= 0.8
		draw_dist -= threerectangles_draw_shift
		draw_blast(_x, _y, draw_dist, angle, display_angle, ray_width, threerectangles_draw_shift, alpha)
		
		ray_width *= 0.65
		draw_dist -= threerectangles_draw_shift
		draw_blast(_x, _y, draw_dist, angle, display_angle, ray_width, threerectangles_draw_shift, alpha)
	}
}

// Debug

if global.debug
{
	draw_set_alpha(0.5)
	var _depth = gpu_get_depth()
	gpu_set_depth(0)
	for (var i = 0 ; i < array_length(owner.collision_box) ; i++)
	{
		if owner.collision_box[i].x1 = "" {break}
		draw_rectangle_colour(owner.collision_box[i].x1, owner.collision_box[i].y1, owner.collision_box[i].x2, owner.collision_box[i].y2, c_red, c_red, c_red, c_red, 0)
	}
	draw_set_alpha(1)
	gpu_set_depth(_depth)
}

}