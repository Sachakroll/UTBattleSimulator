visible = global.debug

function calculate_collision(box)
{
	var scale = sprite_get_width(sprite_index)
	image_angle = box.rot + 90
	image_xscale = (box.x2 - box.x1)/scale
	image_yscale = (box.y2 - box.y1)/scale
	
	var dist_to_pt1 = point_distance(box.rot_x, box.rot_y, box.x1, box.y1)
	var pt1_original_angle = point_direction(box.rot_x, box.rot_y, box.x1, box.y1)
	var pt1_new_angle = pt1_original_angle + box.rot + 90
	x = box.rot_x + lengthdir_x(dist_to_pt1, pt1_new_angle)
	y = box.rot_y + lengthdir_y(dist_to_pt1, pt1_new_angle)
	
	return place_meeting(x, y, oSoul)
}