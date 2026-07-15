// Initialisation des variables

// Tours

global.turn = "player"
global.turn_number = 1
global.boss_turn_timer = 0
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

// Atk bone hor/ver

atk_bone_mouse_tolerance = 5
atk_bone_spawn_boxdist = 9
atk_bone_middleclick_dist = 13

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
box_max_height = 144
box_height = box_default_height
box_target_height = box_default_height

// Fin du combat

win_anim_timer = 0
win_anim_time1 = 30
win_anim_time2 = 60
battle_ended = false

// Initialisation du dialogue

current_dialog = random_dialog()
rendered_characters = [0, 0, 0]

// Création des boutons du joueur

for (var i = 0 ; i < 4 ; i++)
{instance_create_layer(0, 0, "Interface", oPlayer_button, {number : i})}