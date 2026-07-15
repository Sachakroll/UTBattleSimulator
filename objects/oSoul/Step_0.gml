if global.turn = "boss"
{
	visible = true

	move_x = pressed("r", 1) - pressed("l", 1)
	move_y = pressed("d", 1) - pressed("u", 1)
	
	if global.soulmode = 0
	{hsp = move_x
		vsp = move_y}
	if global.soulmode = 1
	{
		if y + vsp >= oBattle.box_bottom - wall_dist - 2
		{
			jump_timer = 0
			if pressed("u", 0) {jumping = true}
		}
		if jumping
		{
		    if jump_timer < jump_max_dur
			{
			    gravity_speed = -jump_v
				jump_timer ++
		    }
		    else {jumping = false}
		}
		if keyboard_check_released(vk_up) || !pressed("u", 1) {jumping = false
			if gravity_speed = -jump_v {gravity_speed = -jump_v/2}}
		
		if y >= oBattle.box_bottom - wall_dist - 2
		{
			if !jumping {gravity_speed = 0}
			}
		else
		{
			if gravity_speed > 0 && gravity_speed < 0.28
			{gravity_speed += 0.035}
			else {gravity_speed += gravity_acc}
		}
		
		hsp = move_x
		vsp = gravity_speed
	}
	else {gravity_speed = 0
		input_vsp = 0
		jumping = false}
	
	if x + hsp > 160 + (oBattle.box_width/2) - wall_dist - 1
	{x = 160 + (oBattle.box_width/2) - wall_dist - 1}
	else {
		if x + hsp < 160 - (oBattle.box_width/2) + wall_dist + 0.25
		{x = 160 - (oBattle.box_width/2) + wall_dist + 0.25}
		else {x += hsp}
	}
	if y + vsp > oBattle.box_bottom - wall_dist - 1
	{y = oBattle.box_bottom - wall_dist - 1
		gravity_speed = 0}
	else {
		if y + vsp < oBattle.box_bottom-oBattle.box_height + wall_dist + 0.25
		{y = oBattle.box_bottom-oBattle.box_height + wall_dist + 0.25}
		else {y += vsp}
	}
	
	// Dégats
	
	with oAtk
	{
		if other.x + 5-other.collision_tolerance > collision_x1
		&& other.x - 4+other.collision_tolerance < collision_x2
		&& other.y + 5-other.collision_tolerance > collision_y1
		&& other.y - 4+other.collision_tolerance < collision_y2
		{
			if !enable_colors
			{other.damage_soul(atk_dmg)}
			else
			{
				if color = 0 || (color = 1 && (other.hsp != 0 || other.vsp != 0))
				|| (color = 2 && other.hsp = 0 && other.vsp = 0)
				{other.damage_soul(atk_dmg)}
			}
		}
	}
}

dmg_timer ++

if global.turn = "player"
{
	visible = true
	
	if oBattle.player_current_action = 0
	{
		y = 226
		x = 24 + 78*global.selected_button
	}
	else
	{
		x = global.text_starting_x + 6
		y = global.text_starting_y + 6
		if oBattle.selected_mercy = 1
		{y = global.text_starting_y + 6 + global.dialog_interline}
	}
}

if global.turn = "flee"
{
	x--
	if global.soulmode = 0 {sprite_index = sWalking_soul_red}
	if global.soulmode = 1 {sprite_index = sWalking_soul_blue}
	image_speed = 1
}
else
{
	if dmg_timer < dmg_invulnerability_time && (dmg_timer mod dmg_flickering_period < dmg_flickering_period/2)
	{sprite_index = sSoul_damaged}
	else {sprite_index = sSoul}
	image_speed = 0
	
	image_index = global.soulmode
}

if global.turn != "boss" && global.turn != "player" && global.turn != "flee"
{
	visible = false
}