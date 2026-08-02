// Sprite et thème du boss

if global.boss_name = "Toriel" {sprite_index = sBoss_toriel}
if global.boss_name = "Papyrus" {sprite_index = sBoss_papyrus}
if global.boss_name = "Asgore" {sprite_index = sBoss_asgore}
if global.boss_name = "Sans" {sprite_index = sBoss_sans}

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