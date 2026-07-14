image_speed = 0

if global.turn = "atk"
{
	if oBattle.atk_step = 0	
	{x += 3}
	if oBattle.atk_step = 0.5 || oBattle.atk_step = 1
	{image_speed = 1}
}
else {instance_destroy()}

show_debug_message(image_speed)