// Sprite et thème du boss

sprite_index = sprite_from_boss(global.boss_name)
if global.ubervolume = 1 && global.enable_music {global.music = music_from_boss(global.boss_name)}

// Tremblement quand le boss prend des dégats

if global.turn = "atk" && oBattle.atk_step = 1
{
	dmg_timer ++
	x = base_x + 3*(2*(dmg_timer mod 6 >= 3)-1)*(1-oBattle.atk_end_timer/oBattle.atk_end_duration)
}
else {x = base_x}

// Disparition

if global.turn = "end" && oBattle.win_anim_timer <= oBattle.win_anim_time2
{
	image_alpha -= 1/oBattle.win_anim_time2
	if oBattle.win_anim_timer = oBattle.win_anim_time2 {image_alpha = 0}
}

// Animations spécifiques à un boss

if global.boss_name = "Sans"
{
	sans_head_rel_x = sans_torso_rel_x
	
	var timer_mod_76 = anim_timer mod 76
	if timer_mod_76 = 0 || timer_mod_76 = 12 {sans_torso_rel_x += 1/2}
	if timer_mod_76 = 38 || timer_mod_76 = 50 {sans_torso_rel_x -= 1/2}
	
	var timer_mod_38 = anim_timer mod 38
	if timer_mod_38 = 2 || timer_mod_38 = 12 {sans_torso_rel_y += 1/2}
	if timer_mod_38 = 20 || timer_mod_38 = 30 {sans_torso_rel_y -= 1/2}
	
	if timer_mod_38 = 4 || timer_mod_38 = 10 {sans_head_rel_y += 1/2}
	if timer_mod_38 = 22 || timer_mod_38 = 28 {sans_head_rel_y -= 1/2}
}

anim_timer ++