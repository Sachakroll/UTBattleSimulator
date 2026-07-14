// Nom du joueur

var name_tab = string_to_number_array(global.player_name)
var name_rendered_length = 0
for (var i = 0 ; i < string_length(global.player_name) ; i++)
{
	draw_sprite(sS_letters, name_tab[i], 15+name_rendered_length, name_display_y)
	name_rendered_length += s_font_spacing(name_tab[i])
}

// Niveau

draw_sprite(sS_letters, 11, 30+smallfont_space*string_length(global.player_name), name_display_y)
draw_sprite(sS_letters, 21, 40+smallfont_space*string_length(global.player_name), name_display_y)
var lv_tab = string_to_number_array(string(int64(global.player_lv)))
draw_sprite(sS_letters, lv_tab[0], 54+smallfont_space*string_length(global.player_name), name_display_y)
if global.player_lv >= 10
{draw_sprite(sS_letters, lv_tab[1], 64+smallfont_space*string_length(global.player_name), name_display_y)}

// Barre de vie

draw_rectangle_colour(166, name_display_y, 166+(3/4)*global.player_max_hp, name_display_y+10, c_red, c_red, c_red, c_red, 0)
draw_rectangle_colour(166, name_display_y, 166+(3/4)*global.player_hp, name_display_y+10, c_yellow, c_yellow, c_yellow, c_yellow, 0)

var hp_str = string(int64(global.player_hp))
if string_length(hp_str) = 1 {hp_str = "0" + hp_str}
var hp_tab = string_to_number_array(hp_str + string(int64(global.player_max_hp)))

draw_sprite(sS_letters, hp_tab[0], 175+(3/4)*global.player_max_hp, name_display_y)
draw_sprite(sS_letters, hp_tab[1], 185+(3/4)*global.player_max_hp, name_display_y)
draw_sprite(sS_letters, 63, 200+(3/4)*global.player_max_hp, name_display_y)
draw_sprite(sS_letters, hp_tab[2], 215+(3/4)*global.player_max_hp, name_display_y)
draw_sprite(sS_letters, hp_tab[3], 225+(3/4)*global.player_max_hp, name_display_y)

// Boite de dialogue

if do_render_box
{
	draw_sprite_stretched(sDialog_box, 0, 160-(box_width/2), box_bottom-box_height, box_width, box_height)
}

// Nom du boss

if do_render_boss_name
{
	var bossname_tab = string_to_number_array("* "+global.boss_name)
	var rendered_text_length = 0
	for (var i = 0 ; i < array_length(bossname_tab) ; i++)
	{
		draw_sprite(sN_letters, bossname_tab[i], global.text_starting_x+soul_taken_text_space+rendered_text_length, global.text_starting_y)
		rendered_text_length += n_font_spacing(bossname_tab[i])
	}
}

// Cible d'attaque

if do_render_atk_target
{
	if global.turn = "atk"
	{draw_sprite(sPlayer_atk_target, 0, 160, box_bottom-box_height/2)}
	if global.turn = "to boss"
	{
		atk_target_alpha -= 1/atk_endtrans_time
		draw_sprite_ext(sPlayer_atk_target, 0, 160, box_bottom-box_height/2, box_width/box_max_width, 
		box_height/box_default_height, 0, c_white, atk_target_alpha)
	}
	if global.turn = "end" && win_anim_timer <= win_anim_time1
	{
		atk_target_alpha -= 1/win_anim_time1
		var fake_box_width = box_width*(1-(2/3)*(win_anim_timer/win_anim_time1))
		draw_sprite_ext(sPlayer_atk_target, 0, 160, box_bottom-box_height/2, fake_box_width/box_max_width, 
		box_height/box_default_height, 0, c_white, atk_target_alpha)
	}
}

// Animation d'attaque

if global.turn = "atk" && atk_step = 0.5
{
	var img_nb = 5
	if atk_anim_timer < 5*atk_anim_time/6 {img_nb = 4}
	if atk_anim_timer < 4*atk_anim_time/6 {img_nb = 3}
	if atk_anim_timer < 3*atk_anim_time/6 {img_nb = 2}
	if atk_anim_timer < 2*atk_anim_time/6 {img_nb = 1}
	if atk_anim_timer < atk_anim_time/6 {img_nb = 0}
	draw_sprite(sSlash_animation, img_nb, oBoss.x, oBoss.y - 24)
}

// Dégats à l'ennemi

if (global.turn = "atk" && atk_step = 1) || (global.turn = "to boss" && do_render_atk_target) || (global.turn = "end" && win_anim_timer < win_anim_time1)
{
	if last_dealt_dmg != 0
	{
		if global.turn = "atk" {boss_displayed_hp -= (last_dealt_dmg)/atk_end_duration}
		if boss_displayed_hp < 0 {boss_displayed_hp = 0}
		
		var dy = -15*sin(2*pi*atk_end_timer/atk_end_duration)
		var dmg_tab = string_to_number_array(string(last_dealt_dmg))
		if atk_end_timer >= atk_end_duration/2 {dy = 0}
		for (var i = 0 ; i < array_length(dmg_tab) ; i++)
		{draw_sprite(sDmg_numbers, dmg_tab[i], 152+16*i, 18+dy)}
		
		var colr = make_colour_rgb(64, 64, 64)
		draw_rectangle_colour(160-boss_hurtbar_length/2, 26, 160+boss_hurtbar_length/2,
		26+boss_hurtbar_height, colr, colr, colr, colr, 0)
		colr = make_colour_rgb(6, 252, 4)
		draw_rectangle_colour(160-boss_hurtbar_length/2, 26,
		160+boss_hurtbar_length*((boss_displayed_hp/global.boss_max_hp)-(1/2)),
		26+boss_hurtbar_height, colr, colr, colr, colr, 0)
	}
	else
	{
		atk_miss_timer ++
		var dy = -15*sin(2*pi*atk_miss_timer/atk_end_duration)
		if atk_miss_timer >= atk_end_duration/2 {dy = 0}
		draw_sprite(sPlayer_atk_miss, 0, 152, 26+dy)
	}
}

// Barre de temps du tour du boss

var colr = make_colour_rgb(31, 191, 0)
if global.turn = "boss"
{
	draw_rectangle_colour(320-59, 25, 320-59+57*(1-global.boss_turn_timer/global.boss_turn_time), 30, 
	colr, colr, colr, colr, 0)
}
if global.turn = "to boss"
{
	draw_rectangle_colour(320-59, 25, 320-59+57*(to_boss_timer/atk_endtrans_time), 30, 
	colr, colr, colr, colr, 0)
}

// Mercy

if global.turn = "player" && player_current_action = "mercy"
{
	var spare_tab = string_to_number_array("* Spare")
	var rendered_text_length = 0
	for (var i = 0 ; i < array_length(spare_tab) ; i++)
	{
		draw_sprite(sN_letters, spare_tab[i], global.text_starting_x+soul_taken_text_space+rendered_text_length, global.text_starting_y)
		rendered_text_length += n_font_spacing(spare_tab[i])
	}
	var flee_tab = string_to_number_array("* Flee")
	var rendered_text_length_b = 0
	for (var i = 0 ; i < array_length(flee_tab) ; i++)
	{
		draw_sprite(sN_letters, flee_tab[i], global.text_starting_x+soul_taken_text_space+rendered_text_length_b, global.text_starting_y+global.dialog_interline)
		rendered_text_length_b += n_font_spacing(flee_tab[i])
	}
}

// Check

if global.turn = "player" && player_current_action = "act"
{
	var check_tab = string_to_number_array("* Check")
	var rendered_text_length = 0
	for (var i = 0 ; i < array_length(check_tab) ; i++)
	{
		draw_sprite(sN_letters, check_tab[i], global.text_starting_x+soul_taken_text_space+rendered_text_length, global.text_starting_y)
		rendered_text_length += n_font_spacing(check_tab[i])
	}
}

// Dialogue

if global.turn = "dialog" || (global.turn = "player" && player_current_action = 0) || global.turn = "end" || global.turn = "flee"
{
	var dlg_tab = [string_to_number_array(current_dialog[0]), string_to_number_array(current_dialog[1]), string_to_number_array(current_dialog[2])]
	for (var line = 0 ; line < 3 ; line++)
	{
		var rendered_text_length = 0
		if rendered_characters[line] != array_length(dlg_tab[line]) 
		&& (line = 0 || rendered_characters[0] = array_length(dlg_tab[0]))
		&& (line != 2 || (rendered_characters[0] = array_length(dlg_tab[0]) && rendered_characters[1] = array_length(dlg_tab[1])))
		{
			if alternating_timer = 1 {array_set(rendered_characters, line, rendered_characters[line]+1)}
			if mouth_timer = 0 {audio_play_sound(snd_text, 0, 0, 1)}
		}
		for (var i = 0 ; i < rendered_characters[line] ; i++)
		{
			draw_sprite(sN_letters, dlg_tab[line][i], global.text_starting_x+rendered_text_length+(global.turn = "flee")*global.dialog_interline, global.text_starting_y+line*global.dialog_interline)
			rendered_text_length += n_font_spacing(dlg_tab[line][i])
		}
	}
}

// Surface de combat

global.surface = surface_create(box_width, box_height)