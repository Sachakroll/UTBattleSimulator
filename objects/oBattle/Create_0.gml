// Initialisation des variables

// Tours

global.turn = "player"
global.turn_number = 1
global.boss_turn_timer = 0
global.boss_turn_time = 60*global.boss_turn_seconds
to_boss_timer = 0
to_boss_min_time = 36

// Barres de vie

global.player_hp = global.player_max_hp
global.boss_hp = global.boss_max_hp

// Disposition de l'interface

global.text_starting_x = 28
global.text_starting_y = 137
name_display_y = 201
box_bottom = 196
soul_taken_text_space = 19
smallfont_space = 10
global.dialog_interline = 16
box_trans_hsp = 6
box_trans_vsp = 3
global.surface = noone

do_render_boss_name = false
do_render_box = true

// Actions du joueur

global.selected_button = 0
player_current_action = 0
selected_mercy = 0
alternating_timer = 0
mouth_timer = 0

// Attaque par le joueur

do_render_atk_target = false
atk_bar_inst = -1
atk_step = 0
atk_end_timer = 0
atk_end_duration = 60
atk_endtrans_time = 0
atk_target_alpha = 0
last_dealt_dmg = 0
atk_miss_timer = 0
atk_anim_timer = 0
atk_anim_time = 40
boss_hurtbar_length = 72
boss_hurtbar_height = 8
boss_displayed_hp = global.boss_hp

// Actions du boss

global.selected_boss_action = 0
global.soulmode = 0
global.soulmodes_count = sprite_get_number(sBoss_act_soul)
global.boss_atk_color = 0
global.boss_atk_colors_count = sprite_get_number(sBoss_act_atkcolor)
boss_action_was_just_selected = false
boss_atk_cooldown = 0
boss_can_attack = true

// Atk bone hor/ver

atk_bone_mouse_tolerance = 5
atk_bone_spawn_boxdist = 9
atk_bone_middleclick_dist = 14

// Atk fire

enable_wall_fire = false
wall_fire_summon_interval = 10
wall_fire_min_vsp = 1/3
wall_fire_max_vsp = 1
function summon_wall_fire(side)
{
	var random_vsp = random_range(-wall_fire_max_vsp, wall_fire_max_vsp)
	if abs(random_vsp) < wall_fire_min_vsp {random_vsp = sign(random_vsp)*wall_fire_min_vsp}
	instance_create_layer(160+side*box_width/2-side*8, box_bottom-box_height/4, "Bullets", oAtk, {type : "wall fire", vert_speed : random_vsp, wall_side : side})
}
function summon_fire(_dir)
{
	instance_create_layer(160, box_bottom-box_height+4, "Bullets", oAtk, {type : "fire", dir : _dir})
}

// Atk toriel hand

toriel_hand_left_inst = noone
toriel_hand_right_inst = noone
toriel_hand_spawn_boxdist = 8
toriel_hand_atk_cooldown_time = 60
function summon_toriel_hand(_dir)
{
	return instance_create_layer(160-_dir*(box_width/2+toriel_hand_spawn_boxdist), box_bottom-box_height*(1/2+_dir*7/20), "Bullets", oAtk, {type : "toriel hand", dir : _dir})
}

// Atk blaster

blaster_spawn_mouse_movement_deadzone = 3
blaster_spawn_step_size = 12
blaster_spawn_screen_dist = 32
blaster_spawn_delay = 6
blaster_max_spawn_delay = 24
blaster_spawn_timer = -1
blaster_scale = 1
atklaunching_initial_mouse_x = 0
atklaunching_initial_mouse_y = 0

// Atk sans slam

sans_slam_mouse_tolerance = 5
sans_slam_atk_cooldown_time = 6
sans_slam_old_soulmode = 0
sans_slam_timer = -1
sans_slam_atk_time = 45
sans_slam_has_been_reinitialized = true
function reinit_soul_after_sans_slam()
{
	sans_slam_timer = -1
	sans_slam_has_been_reinitialized = true
	global.soulmode = sans_slam_old_soulmode
	oSoul.gravity_dir = "down"
}

// Action resize

resize_tolerance = 10
resize_horizontal = 0
resize_vertical = 0
resize_starting_x = 0
resize_starting_y = 0
resize_starting_height = 0
resize_starting_width = 0

// Dimensions du cadre

box_default_width = 96
box_min_width = 26
box_max_width = 288
box_width = box_max_width
box_target_width = box_default_width

box_default_height = 70
box_min_height = 26
box_max_height = 135
box_height = box_default_height
box_target_height = box_default_height

// Choses à réinitialiser à la fin du tour du boss

function boss_reinit_variables()
{
	blaster_spawn_timer = -1
	if sans_slam_timer != - 1 && sans_slam_timer < sans_slam_atk_time
	{reinit_soul_after_sans_slam()}
}

// Fin du combat

win_anim_timer = 0
win_anim_time1 = 30
win_anim_time2 = 60
battle_ended = false

// Inventaire

global.inventory = []
for (var i = 0 ; i < global.player_items ; i++)
{
	array_push(global.inventory, "Food "+string(i))
}
item_x_shift = 120
item_page_x_shift = item_x_shift + soul_taken_text_space + 26
selected_item = 0
heal_timer = -1
heal_delay = 18

// Initialisation du dialogue

current_dialog = random_dialog()
rendered_characters = [0, 0, 0]

// Création des boutons du joueur

for (var i = 0 ; i < 4 ; i++)
{instance_create_layer(0, 0, "Interface", oPlayer_button, {number : i})}