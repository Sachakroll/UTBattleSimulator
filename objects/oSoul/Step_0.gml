if global.turn = "boss"
{
	visible = true

	move_x = pressed("r", 1) - pressed("l", 1)
	move_y = pressed("d", 1) - pressed("u", 1)
	
	// Âme rouge
	if global.soulmode = 0
	{
		hsp = move_x
		vsp = move_y
	}
	
	// Âme bleue
	if global.soulmode = 1
	{
		if gravity_dir != old_gravity_dir
		{gravity_speed = switch_gravity_speed(old_gravity_dir, gravity_dir)}
		
		if soul_is_on_ground(x + hsp, y + vsp, 3)
		{
			wall_slam = false
			jump_timer = 0
			if button_jump_pressed() {jumping = true}
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
		if button_jump_not_pressed()
		{
			jumping = false
			if gravity_speed = -jump_v {gravity_speed = -jump_v/2}
		}
		
		if !soul_is_on_ground(x, y, 1)
		{
			if wall_slam {gravity_speed += wall_slam_gravity_acc}
			else {
				if gravity_speed > 0 && gravity_speed < 0.28 {gravity_speed += smaller_gravity_acc}
				else {gravity_speed += gravity_acc}
			}
		}
		show_debug_message(gravity_speed)
		
		if gravity_dir = "up" || gravity_dir = "down"
		{
			hsp = move_x
			vsp = gravity_speed * (2*(gravity_dir="down")-1)
		}
		if gravity_dir = "left" || gravity_dir = "right"
		{
			hsp = gravity_speed * (2*(gravity_dir="right")-1)
			vsp = move_y
		}
	}
	else
	{
		gravity_speed = 0
		jumping = false
		wall_slam = false
	}
	
	// Collision avec le cadre
	
	if x + hsp > 160 + (oBattle.box_width/2) - wall_dist - 1
	{x = 160 + (oBattle.box_width/2) - wall_dist - 1
		if gravity_dir = "right" {gravity_speed = 0}}
	else {
		if x + hsp < 160 - (oBattle.box_width/2) + wall_dist + 0.25
		{x = 160 - (oBattle.box_width/2) + wall_dist + 0.25
			if gravity_dir = "left" {gravity_speed = 0}}
		else {x += hsp}
	}
	if y + vsp > oBattle.box_bottom - wall_dist - 1
	{y = oBattle.box_bottom - wall_dist - 1
		if gravity_dir = "down" {gravity_speed = 0}}
	else {
		if y + vsp < oBattle.box_bottom-oBattle.box_height + wall_dist + 0.25
		{y = oBattle.box_bottom-oBattle.box_height + wall_dist + 0.25
			if gravity_dir = "up" {gravity_speed = 0}}
		else {y += vsp}
	}
	
	// Dégats
	
	with oAtk
	{
		for (var i = 0 ; i < array_length(collision_box) ; i++)
		{
			if collision_box[i].x1 = "" || atk_dmg = 0 {break}
			
			if other.detect_collision(collision_box[i])
			{
				if !enable_colors
				{
					if destructible {other.damage_soul(atk_dmg, id)}
					else {other.damage_soul(atk_dmg, noone)}
				}
				else
				{
					if color = 0 || (color = 1 && (other.hsp != 0 || other.vsp != 0))
					|| (color = 2 && other.hsp = 0 && other.vsp = 0)
					{
						if destructible {other.damage_soul(atk_dmg, id)}
					else {other.damage_soul(atk_dmg, noone)}
					}
				}
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
		if oBattle.player_current_action = "item"
		{
			x = global.text_starting_x + 6 + oBattle.item_x_shift*(oBattle.selected_item mod 2 = 1)
			y = global.text_starting_y + 6 + global.dialog_interline*(oBattle.selected_item mod 4 >= 2)
		}
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
	
	if global.soulmode = 1 && gravity_dir != "down"
	{
		switch gravity_dir
		{
			case "right" : image_index = global.soulmodes_count ; break
			case "up" : image_index = global.soulmodes_count + 1 ; break
			case "left" : image_index = global.soulmodes_count + 2 ; break
		}
	}
}

if global.turn != "boss" && global.turn != "player" && global.turn != "flee"
{
	visible = false
}