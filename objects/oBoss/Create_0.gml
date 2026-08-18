base_x = x
dmg_timer = 0

image_alpha = 1
image_index = 0

// Variables spécifiques à un boss

// Sans

sans_torso_draw_height = sprite_get_height(sBoss_sans_legs)
sans_head_draw_height = sprite_get_height(sBoss_sans_torso) + sans_torso_draw_height

// Variables à reset quand le boss change

function reset_animations()
{
	anim_timer = 0
	
	// Sans
	sans_torso_rel_x = 0
	sans_torso_rel_y = 0
	sans_head_rel_x = 0
	sans_head_rel_y = 0
}

reset_animations()