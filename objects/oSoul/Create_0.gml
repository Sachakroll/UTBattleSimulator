wall_dist = 7
gravity_speed = 0
input_vsp = 0
hsp = 0
vsp = 0

jump_max_dur = 18
jump_timer = 0
jumping = false
jump_v = 1.42
gravity_acc = 0.0791015625

collision_tolerance = 0
down_collision_tolerance = 1
dmg_invulnerability_time = 120
dmg_timer = dmg_invulnerability_time
dmg_flickering_period = 12 // nombre pair

function damage_soul(dealt_dmg)
{
	if dmg_timer > dmg_invulnerability_time
	{
		global.player_hp -= dealt_dmg
		audio_play_sound(snd_dmg, 12, 0, 1)
		dmg_timer = 0
	}
}