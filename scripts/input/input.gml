function pressed(button, maintien)
{
	if maintien
	{
		if button = "z" {return (keyboard_check(vk_enter) || keyboard_check(ord("Z")))}
		if button = "x" {return (keyboard_check(vk_shift) || keyboard_check(ord("X")))}
		if button = "l" {return (keyboard_check(vk_left))}
		if button = "r" {return (keyboard_check(vk_right))}
		if button = "u" {return (keyboard_check(vk_up))}
		if button = "d" {return (keyboard_check(vk_down))}
	}
	if !maintien
	{
		if button = "z" {return (keyboard_check_pressed(vk_enter) || keyboard_check_pressed(ord("Z")))}
		if button = "x" {return (keyboard_check_pressed(vk_shift) || keyboard_check_pressed(ord("X")))}
		if button = "l" {return (keyboard_check_pressed(vk_left))}
		if button = "r" {return (keyboard_check_pressed(vk_right))}
		if button = "u" {return (keyboard_check_pressed(vk_up))}
		if button = "d" {return (keyboard_check_pressed(vk_down))}
	}
}