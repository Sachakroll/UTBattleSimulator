if global.config_done
{
	var inv = 1-2*global.gamepad_maps.inv_v
	hsp = (gamepad_axis_value(global.gamepad, global.gamepad_maps._h) > global.gamepad_deadzone) - (gamepad_axis_value(global.gamepad, global.gamepad_maps._h) < -global.gamepad_deadzone)
	vsp = (gamepad_axis_value(global.gamepad, global.gamepad_maps._v)*inv > global.gamepad_deadzone) - (gamepad_axis_value(global.gamepad, global.gamepad_maps._v)*inv < -global.gamepad_deadzone)
}

// Collisions

if x + hsp > 160 + oSettings_gamepad.box_width/2 - wall_dist - 1
{x = 160 + oSettings_gamepad.box_width/2 - wall_dist - 1}
else {
	if x + hsp < 160 - oSettings_gamepad.box_width/2 + wall_dist + 0.25
	{x = 160 - oSettings_gamepad.box_width/2 + wall_dist + 0.25}
	else {x += hsp}
}
if y + vsp > oSettings_gamepad.box_top+oSettings_gamepad.box_height - wall_dist - 1
{y = oSettings_gamepad.box_top+oSettings_gamepad.box_height - wall_dist - 1
	gravity_speed = 0}
else {
	if y + vsp < oSettings_gamepad.box_top + wall_dist + 0.25
	{y = oSettings_gamepad.box_top + wall_dist + 0.25}
	else {y += vsp}
}
