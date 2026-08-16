timer = 0

if !instance_exists(owner) {instance_destroy()}
else {

// Variables spécifiques à un type d'attaque

if owner.type = "bone hor" || owner.type = "bone vert" {sprite_init = false}

if owner.type = "blaster"
{
	function draw_blast(__x, __y, __dist, __angle, __display_angle, __width, __length, __alpha)
	{
		var draw_x = __x + lengthdir_x(__dist, __angle) + lengthdir_x(__width/2, __angle-90)
		var draw_y = __y + lengthdir_y(__dist, __angle) + lengthdir_y(__width/2, __angle-90)
		draw_sprite_general(sWhite_rectangle, 0, 0, 0, 1, 1, draw_x, draw_y, __width, __length, __display_angle, c_white, c_white, c_white, c_white, __alpha)
	}
}

}