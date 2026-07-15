if (async_load[? "event_type"] == "gamepad discovered")
{
	global.gamepad_detected = true
	global.gamepad = async_load[? "pad_index"]
	global.gamepad_name = gamepad_get_description(global.gamepad)
	gamepad_set_axis_deadzone(global.gamepad, global.gamepad_deadzone)
	
	if file_exists(gamepad_get_description(global.gamepad)+".txt")
	{
		var _file = file_text_open_read(gamepad_get_description(global.gamepad)+".txt")
		global.gamepad_maps = json_parse(file_text_read_string(_file))
		file_text_close(_file)
	}
}

if (async_load[? "event_type"] == "gamepad lost")
{
	global.gamepad_detected = false
	global.gamepad = -1
}