draw_self()

// Animations spécifiques à un boss

if global.boss_name = "Sans"
{
	draw_sprite(sBoss_sans_torso, 0, x + sans_torso_rel_x, y - sans_torso_draw_height + sans_torso_rel_y)
	draw_sprite(sBoss_sans_head, 0, x + sans_head_rel_x, y - sans_head_draw_height + sans_head_rel_y)
}