function pressed(button, maintien)
{
	var inv = 1-2*global.gamepad_maps.inv_v
	if maintien
	{
		if button = "z" {return (keyboard_check(vk_enter) || keyboard_check(ord("Z")) || gamepad_button_check(global.gamepad, global.gamepad_maps._z))}
		if button = "x" {return (keyboard_check(vk_shift) || keyboard_check(ord("X")) || gamepad_button_check(global.gamepad, global.gamepad_maps._x))}
		if button = "l" {return (keyboard_check(vk_left) || gamepad_axis_value(global.gamepad, global.gamepad_maps._h) < -global.gamepad_deadzone)}
		if button = "r" {return (keyboard_check(vk_right) || gamepad_axis_value(global.gamepad, global.gamepad_maps._h) > global.gamepad_deadzone)}
		if button = "u" {return (keyboard_check(vk_up) || gamepad_axis_value(global.gamepad, global.gamepad_maps._v)*inv < -global.gamepad_deadzone)}
		if button = "d" {return (keyboard_check(vk_down) || gamepad_axis_value(global.gamepad, global.gamepad_maps._v)*inv > global.gamepad_deadzone)}
	}
	if !maintien
	{
		if button = "z" {return (keyboard_check_pressed(vk_enter) || keyboard_check_pressed(ord("Z")) || gamepad_button_check_pressed(global.gamepad, global.gamepad_maps._z))}
		if button = "x" {return (keyboard_check_pressed(vk_shift) || keyboard_check_pressed(ord("X")) || gamepad_button_check_pressed(global.gamepad, global.gamepad_maps._x))}
		if button = "l" {return (keyboard_check_pressed(vk_left) || (gamepad_axis_value(global.gamepad, global.gamepad_maps._h) < -global.gamepad_deadzone && !global.prev_input_l))}
		if button = "r" {return (keyboard_check_pressed(vk_right) || (gamepad_axis_value(global.gamepad, global.gamepad_maps._h) > global.gamepad_deadzone && !global.prev_input_r))}
		if button = "u" {return (keyboard_check_pressed(vk_up) || (gamepad_axis_value(global.gamepad, global.gamepad_maps._v)*inv < -global.gamepad_deadzone && !global.prev_input_u))}
		if button = "d" {return (keyboard_check_pressed(vk_down) || (gamepad_axis_value(global.gamepad, global.gamepad_maps._v)*inv > global.gamepad_deadzone && !global.prev_input_d))}
	}
}