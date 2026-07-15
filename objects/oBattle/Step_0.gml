// Retour au menu

if keyboard_check_pressed(vk_escape) && oFade.fade_timer = -1 {oFade.fade(24, Menu)
	audio_play_sound(snd_flee, 1, 0, 1)}

// Défilement des dialogues

alternating_timer = 1 - alternating_timer
mouth_timer ++
if mouth_timer = 4 {mouth_timer = 0}
if pressed("x", 0)
{rendered_characters = [string_length(current_dialog[0]), string_length(current_dialog[1]), string_length(current_dialog[2])]}

// Fin du combat

if global.turn = "end"
{
	win_anim_timer ++
	if pressed("z", 0) && !battle_ended {
		oFade.fade(30, Menu)
		battle_ended = true
		global.fights_won ++}
}

// Attaque du joueur

if global.turn = "atk"
{
	do_render_atk_target = true
	atk_target_alpha = 1
	
	var aettw = abs(box_target_width-box_width)/box_trans_hsp
	var aetth = abs(box_target_height-box_height)/box_trans_vsp
	if aettw >= aetth {atk_endtrans_time = aettw}
	else {atk_endtrans_time = aetth}
	if atk_endtrans_time < to_boss_min_time {atk_endtrans_time = to_boss_min_time}
	
	if atk_step = 0
	{
		if pressed("z", 0)
		{
			atk_step = 0.5
			atk_anim_timer = 0
			audio_play_sound(snd_slash, 1, 0, 1)
		}
		if atk_bar_inst.x > 160 + box_width/2
		{
			atk_step = 0
			global.turn = "to boss"
			last_dealt_dmg = 0
			atk_miss_timer = 0
			to_boss_timer = 0
		}
	}
	if atk_step = 0.5
	{
		atk_anim_timer ++
		if atk_anim_timer = atk_anim_time
		{
			atk_step = 1
			last_dealt_dmg = damage(oPlayer_atk_bar.x)
			if last_dealt_dmg = 0 {last_dealt_dmg = 1}
			audio_play_sound(snd_hurt, 1, 0, 1)
			boss_displayed_hp = global.boss_hp
			global.boss_hp -= last_dealt_dmg
			if global.boss_hp < 0 {global.boss_hp = 0}
		}
	}
	if atk_step = 1
	{
		atk_end_timer ++
		if atk_end_timer = atk_end_duration
		{
			atk_step = 0
			global.turn = "to boss"
			to_boss_timer = 0
			boss_displayed_hp = global.boss_hp
			if global.boss_hp = 0
			{
				audio_play_sound(snd_dust, 10, 0, 1)
				global.turn = "end"
				current_dialog = win_dialog()
				rendered_characters = [0, 0, 0]
			}
		}
	}
}

// Dialogue à la fin du tour du joueur

if global.turn = "dialog"
{
	if pressed("z", 0) && array_equals(rendered_characters, [string_length(current_dialog[0]), string_length(current_dialog[1]), string_length(current_dialog[2])])
	{
		var aettw = abs(box_target_width-box_width)/box_trans_hsp
		var aetth = abs(box_target_height-box_height)/box_trans_vsp
		if aettw >= aetth {atk_endtrans_time = aettw}
		else {atk_endtrans_time = aetth}
		if atk_endtrans_time < to_boss_min_time {atk_endtrans_time = to_boss_min_time}
		
		global.turn = "to boss"
	}
}

// Tour du joueur

do_render_boss_name = false
if global.turn = "player"
{
	// Sélection des boutons
	if pressed("l", 0) && player_current_action = 0 {global.selected_button --
		audio_play_sound(snd_choice, 1, 0, 1)}
	if pressed("r", 0) && player_current_action = 0 {global.selected_button ++
		audio_play_sound(snd_choice, 1, 0, 1)}
	if global.selected_button < 0 {global.selected_button += 4}
	if global.selected_button > 3 {global.selected_button -= 4}
	
	// Fight
	if global.selected_button = 0 && pressed("z", 0) && player_current_action = 0 && oFade.fade_timer = -1
	{player_current_action = "to fight"
		audio_play_sound(snd_select, 1, 0, 1)}
	
	if player_current_action = "fight"
	{
		do_render_boss_name = true
		if pressed("x", 0) {player_current_action = 0}
		if pressed("z", 0)
		{
			audio_play_sound(snd_select, 1, 0, 1)
			player_current_action = 0
			global.turn = "atk"
			atk_step = 0
			atk_end_timer = 0
			do_render_boss_name = false
			atk_bar_inst = instance_create_depth(160-box_width/2, box_bottom-box_height/2, depth-10, oPlayer_atk_bar)
		}
	}
	
	// Act
	if global.selected_button = 1 && pressed("z", 0) && player_current_action = 0 && oFade.fade_timer = -1
	{player_current_action = "to act"
		audio_play_sound(snd_select, 1, 0, 1)}
	
	if player_current_action = "act"
	{
		if pressed("x", 0) {player_current_action = 0}
		if pressed("z", 0)
		{
			audio_play_sound(snd_select, 1, 0, 1)
			player_current_action = 0
			global.turn = "dialog"
			current_dialog = check_dialog()
			rendered_characters = [0, 0, 0]
		}
	}
	
	// Item
	if global.selected_button = 2 && pressed("z", 0) && player_current_action = 0 && oFade.fade_timer = -1
	{if !array_equals(global.inventory, ["", "", "", ""]) {player_current_action = "to item"}
		audio_play_sound(snd_select, 1, 0, 1)}
	
	if player_current_action = "item"
	{
		if pressed("x", 0) {player_current_action = 0}
	}
	
	// Mercy
	if global.selected_button = 3 && pressed("z", 0) && player_current_action = 0 && oFade.fade_timer = -1
	{player_current_action = "to mercy"
		audio_play_sound(snd_select, 1, 0, 1)}
	
	if player_current_action = "mercy"
	{
		if pressed("x", 0) {player_current_action = 0}
		if pressed("z", 0) && selected_mercy = 0
		{
			audio_play_sound(snd_select, 1, 0, 1)
			player_current_action = 0
			global.turn = "to boss"
			
			var aettw = abs(box_target_width-box_width)/box_trans_hsp
			var aetth = abs(box_target_height-box_height)/box_trans_vsp
			if aettw >= aetth {atk_endtrans_time = aettw}
			else {atk_endtrans_time = aetth}
			if atk_endtrans_time < to_boss_min_time {atk_endtrans_time = to_boss_min_time}
		}
		if pressed("z", 0) && selected_mercy = 1
		{
			global.turn = "flee"
			current_dialog = flee_dialog()
			rendered_characters = [0, 0, 0]
			audio_play_sound(snd_flee, 1, 0, 1)
			oFade.fade(60, Menu)
		}
		if (pressed("d", 0) || pressed ("u", 0)) && !pressed("z", 0)
		{selected_mercy = 1 - selected_mercy}
	}
	else {selected_mercy = 0}
	
	// Délai d'appui
	if player_current_action = "to fight" {player_current_action = "fight"}
	if player_current_action = "to act" {player_current_action = "act"}
	if player_current_action = "to item" {player_current_action = "item"}
	if player_current_action = "to mercy" {player_current_action = "mercy"}
}

// Tour du boss

if global.turn = "boss"
{
	global.boss_turn_timer ++
	if global.boss_turn_timer >= global.boss_turn_time {
		global.turn = "to player"
		global.selected_boss_action = 0}
	
	// Redimensionner le cadre
	if global.selected_boss_action = "resize"
	{
		if mouse_check_button_pressed(mb_left)
		{
			if box_bottom-box_height-resize_tolerance < mouse_y && mouse_y < box_bottom+resize_tolerance
			{
			if abs((160-(box_width/2)) - mouse_x) < resize_tolerance {
				resize_horizontal = -1
				resize_starting_x = mouse_x
				resize_starting_width = box_width}
			if abs((160+(box_width/2)) - mouse_x) < resize_tolerance {
				resize_horizontal = 1
				resize_starting_x = mouse_x
				resize_starting_width = box_width}
			}
			if 160-(box_width/2)-resize_tolerance < mouse_x && mouse_x < 160+(box_width/2)+resize_tolerance
			&& abs((box_bottom-box_height) - mouse_y) < resize_tolerance {
				resize_vertical = -1
				resize_starting_y = mouse_y
				resize_starting_height = box_height}
		}
		if mouse_check_button_released(mb_left) || !mouse_check_button(mb_left) {
			resize_horizontal = 0
			resize_vertical = 0}
		
		if resize_horizontal != 0
		{box_width = resize_starting_width + resize_horizontal*2*(mouse_x-resize_starting_x)}
		if resize_vertical != 0
		{box_height = resize_starting_height + resize_vertical*(mouse_y-resize_starting_y)}
	}
	else
	{resize_horizontal = 0
		resize_vertical = 0}
	if box_height > box_max_height {box_height = box_max_height}
	if box_height < box_min_height {box_height = box_min_height}
	if box_width > box_max_width {box_width = box_max_width}
	if box_width < box_min_width {box_width = box_min_width}
	box_target_height = box_height
	box_target_width = box_width
	
	// Atk bone hor
	if global.selected_boss_action = "atk bone hor" && mouse_y <= box_bottom+atk_bone_mouse_tolerance
	&& mouse_y >= box_bottom-box_height-atk_bone_mouse_tolerance
	&& (mouse_check_button_pressed(mb_left) || mouse_check_button_pressed(mb_right) || mouse_check_button_pressed(mb_middle))
	{
		var _base = "bottom"
		if mouse_check_button_pressed(mb_right) {_base = "top"}
		if mouse_check_button_pressed(mb_middle) {_base = "both"}
		
		var my = mouse_y
		if my < box_bottom-box_height+atk_bone_spawn_boxdist {my = box_bottom-box_height+atk_bone_spawn_boxdist}
		if my > box_bottom-atk_bone_spawn_boxdist {my = box_bottom-atk_bone_spawn_boxdist}
		
		var _dir = 0
		if mouse_x <= 160-(box_width/2)+atk_bone_mouse_tolerance {_dir = 1}
		if mouse_x >= 160+(box_width/2)-atk_bone_mouse_tolerance {_dir = -1}
		
		if _dir != 0
		{
			var botm_my = my
			var top_my = my
			if _base = "both"
			{
				botm_my += atk_bone_middleclick_dist
				if botm_my > box_bottom-atk_bone_spawn_boxdist
				{botm_my = box_bottom-atk_bone_spawn_boxdist
					top_my = botm_my - 2*atk_bone_middleclick_dist}
				else
				{
					top_my -= atk_bone_middleclick_dist
					if top_my < box_bottom-box_height+atk_bone_spawn_boxdist
					{top_my = box_bottom-box_height+atk_bone_spawn_boxdist
						botm_my = top_my + 2*atk_bone_middleclick_dist}
				}
			}
		
			if _base = "bottom" || _base = "both" {
			instance_create_layer(160-_dir*(box_width/2), botm_my, "Bullets", oAtk, 
			{type : "bone hor", dir : _dir, base : "bottom", color : global.boss_atk_color})}
			if _base = "top" || _base = "both" {
			instance_create_layer(160-_dir*(box_width/2), top_my, "Bullets", oAtk, 
			{type : "bone hor", dir : _dir, base : "top", color : global.boss_atk_color})}
		}
	}
	
	// Atk bone vert
	
	if global.selected_boss_action = "atk bone vert" && mouse_x <= 160+(box_width/2)+atk_bone_mouse_tolerance
	&& mouse_x >= 160-(box_width/2)-atk_bone_mouse_tolerance
	&& (mouse_check_button_pressed(mb_left) || mouse_check_button_pressed(mb_right) || mouse_check_button_pressed(mb_middle))
	{
		var _base = "left"
		if mouse_check_button_pressed(mb_right) {_base = "right"}
		if mouse_check_button_pressed(mb_middle) {_base = "both"}
		
		var mx = mouse_x
		if mx < 160-(box_width/2)+atk_bone_spawn_boxdist {mx = 160-(box_width/2)+atk_bone_spawn_boxdist}
		if mx > 160+(box_width/2)-atk_bone_spawn_boxdist {mx = 160+(box_width/2)-atk_bone_spawn_boxdist}
		
		var _dir = 0
		if mouse_y <= box_bottom-box_height+atk_bone_mouse_tolerance {_dir = 1}
		if mouse_y >= box_bottom-atk_bone_mouse_tolerance {_dir = -1}
		
		if _dir != 0
		{
			var left_mx = mx
			var right_mx = mx
			if _base = "both"
			{
				right_mx += atk_bone_middleclick_dist
				if right_mx > 160+(box_width/2)-atk_bone_spawn_boxdist
				{right_mx = 160+(box_width/2)-atk_bone_spawn_boxdist
					left_mx = right_mx - 2*atk_bone_middleclick_dist}
				else
				{
					left_mx -= atk_bone_middleclick_dist
					if left_mx < 160-(box_width/2)+atk_bone_spawn_boxdist
					{left_mx = 160-(box_width/2)+atk_bone_spawn_boxdist
						right_mx = left_mx + 2*atk_bone_middleclick_dist}
				}
			}
		
			if _base = "left" || _base = "both" {
			instance_create_layer(left_mx, box_bottom-((_dir+1)/2)*box_height, "Bullets", oAtk, 
			{type : "bone vert", dir : _dir, base : "left", color : global.boss_atk_color})}
			if _base = "right" || _base = "both" {
			instance_create_layer(right_mx, box_bottom-((_dir+1)/2)*box_height, "Bullets", oAtk, 
			{type : "bone vert", dir : _dir, base : "right", color : global.boss_atk_color})}
		}
	}
}

// Passage du tour du joueur au tour du boss

if global.turn = "to boss"
{
	to_boss_timer ++
	if box_height != box_target_height {box_height += box_trans_vsp*sign(box_target_height-box_height)}
	if abs(box_target_height-box_height) < box_trans_vsp {box_height = box_target_height}
	if box_width != box_target_width {box_width += box_trans_hsp*sign(box_target_width-box_width)}
	if abs(box_target_width-box_width) < box_trans_hsp {box_width = box_target_width}
	if box_height = box_target_height && box_width = box_target_width && to_boss_timer >= to_boss_min_time
	{
		global.turn = "boss"
		global.boss_turn_timer = 0
		
		atk_bar_inst = -1
		do_render_atk_target = false
		oSoul.x = 160
		oSoul.y = box_bottom - (box_height/2)
	}
}

// Passage du tour du boss au tour du joueur

if global.turn = "to player"
{
	if box_height != box_default_height {box_height += box_trans_vsp*sign(box_default_height-box_height)}
	if abs(box_default_height-box_height) < box_trans_vsp {box_height = box_default_height}
	if box_width != box_max_width {box_width += box_trans_hsp*sign(box_max_width-box_width)}
	if abs(box_max_width-box_width) < box_trans_hsp {box_width = box_max_width}
	if box_height = box_default_height && box_width = box_max_width
	{
		global.turn = "player"
		global.turn_number ++
		
		current_dialog = random_dialog()
		rendered_characters = [0, 0, 0]
	}
}

// Mort

if global.player_hp <= 0
{
	global.death_soul_x = oSoul.x
	global.death_soul_y = oSoul.y
	room_goto(Death)
}