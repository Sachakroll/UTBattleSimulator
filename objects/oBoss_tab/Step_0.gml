// Sélection du boss

if mouse_check_button_pressed(mb_left) && mouse_y > 0 && mouse_y < 25 && global.turn != "end" && global.turn != "flee"
{
	if mouse_x > 258 && mouse_x < 277
	{
		global.selected_boss --
		global.boss_name = boss_get_name(global.selected_boss)
		if global.turn = "dialog"
		{oBattle.current_dialog = check_dialog()
			oBattle.rendered_characters = [0, 0, 0]}
		if global.turn = "player"
		{oBattle.current_dialog = random_dialog()
			oBattle.rendered_characters = [0, 0, 0]}
	}
	if mouse_x > 301 && mouse_x < 320
	{
		global.selected_boss ++
		global.boss_name = boss_get_name(global.selected_boss)
		if global.turn = "dialog"
		{oBattle.current_dialog = check_dialog()
			oBattle.rendered_characters = [0, 0, 0]}
		if global.turn = "player"
		{oBattle.current_dialog = random_dialog()
			oBattle.rendered_characters = [0, 0, 0]}
	}
	if global.selected_boss >= global.bosses_nb {global.selected_boss -= global.bosses_nb}
	if global.selected_boss < 0 {global.selected_boss += global.bosses_nb}
}

image_index = global.selected_boss