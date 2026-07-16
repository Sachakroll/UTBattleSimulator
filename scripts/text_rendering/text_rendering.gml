function string_to_number_array(_string)
{
	var alphabet = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789 /.,!?:;-'()%*µ[]_><£€@"
	var str_length = string_length(_string)
	var nb_tab = []
	for (var i = 1 ; i <= str_length ; i++)
	{
		for (var j = 1 ; j <= string_length(alphabet) ; j++)
		{
			if string_char_at(_string, i) = string_char_at(alphabet, j)
			{
				array_push(nb_tab, j-1)
				break
			}
		}
	}
	return nb_tab
}

function n_font_spacing(_char)
{
	var _sp = 2
	if _char = "12" {return 7+_sp}
	if _char = "22" {return 7+_sp}
	if _char = "38" {return 7+_sp}
	if _char = "48" {return 7+_sp}
	if _char = "74" {return 7+_sp}
	if _char = "64" {return 2+_sp}
	if _char = "65" {return 2+_sp}
	if _char = "66" {return 4+_sp}
	if _char = "68" {return 2+_sp}
	if _char = "69" {return 2+_sp}
	if _char = "71" {return 2+_sp}
	if _char = "72" {return 4+_sp}
	if _char = "73" {return 4+_sp}
	if _char = "75" {return 8+_sp}
	if _char = "76" {return 8+_sp}
	if _char = "77" {return 4+_sp}
	if _char = "78" {return 4+_sp}
	if _char = "80" {return 5+_sp}
	if _char = "81" {return 5+_sp}
	if _char = "62" {return 6+_sp}
	if _char = "82" {return 1}
	if _char = "83" {return 5+_sp}
	if _char = "84" {return 5+_sp}
	return 6+_sp
}

function s_font_spacing(_char)
{
	var _sp = 2
	if _char = "12" {return 10+_sp}
	if _char = "22" {return 10+_sp}
	if _char = "38" {return 10+_sp}
	if _char = "48" {return 10+_sp}
	return 8+_sp
}

function check_dialog()
{
	if global.boss_name = "Papyrus"
	{return ["* PAPYRUS 8 ATK 2 DEF£", "* He likes to say:", "µ ''Nyeh heh heh!''"]}
	if global.boss_name = "Toriel"
	{return ["* TORIEL - ATK 80 DEF 80£", "* Knows best for you.", ""]}
	
	return ["[Missing text]", "", ""]
}

function random_dialog()
{
	if global.boss_name = "Toriel"
	{
		if global.turn_number = 1
		{return ["* Toriel blocks the way!", "", ""]}
		var nb = global.turn_number mod 4
		if nb = 0
		{return ["* Toriel prepares a magical", "µ attack.", ""]}
		if nb = 1
		{return ["* Toriel takes a deep breath.", "", ""]}
		if nb = 2
		{return ["* Toriel is acting aloof.", "", ""]}
		if nb = 3
		{return ["* Toriel looks through you.", "", ""]}
	}
	
	if global.boss_name = "Papyrus"
	{
		if global.turn_number = 1
		{return ["* Papyrus blocks the way!", "", ""]}
		if global.turn_number = 2
		{return ["* Papyrus is cackling.", "", ""]}
		if global.turn_number = 3
		{return ["* Papyrus is thinking about", "µ what to wear for his date.", ""]}
		if global.turn_number = 4
		{return ["* Papyrus is thinking about", "µ what to cook for his date.", ""]}
		if global.turn_number = 5
		{return ["* Papyrus dabs marinara sauce", "µ behind his ear.", ""]}
		if global.turn_number = 6
		{return ["* Papyrus dabs MTT-Brand Bishie", "µ Cream behind his ear.", ""]}
		if global.turn_number = 7
		{return ["* Papyrus dabs MTT-Brand Anime", "µ Powder behind his ear.", ""]}
		if global.turn_number = 8
		{return ["* Papyrus dabs MTT-Brand", "µ Attraction Slime behind his", "µ ear."]}
		if global.turn_number = 9
		{return ["* Papyrus dabs MTT-Brand", "µ Beauty Yogurt behind his", "µ ear."]}
		if global.turn_number = 10
		{return ["* Papyrus realizes he doesn't", "µ have ears.", ""]}
		if global.turn_number = 11
		{return ["* Papyrus is considering his", "µ options.", ""]}
		var nb = global.turn_number mod 6
		if nb = 0
		{return ["* Papyrus whispers ''Nyeh heh", "µ heh!''", ""]}
		if nb = 1
		{return ["* Papyrus is trying hard to play", "µ it cool.", ""]}
		if nb = 2
		{return ["* Papyrus is cackling.", "", ""]}
		if nb = 3
		{return ["* Papyrus is rattling his bones.", "", ""]}
		if nb = 4
		{return ["* Papyrus is preparing a bone", "µ attack.", ""]}
		if nb = 5
		{return ["* Smells like bones.", "", ""]}
	}
	
	return ["[Missing text]", "", ""]
}

function win_dialog()
{
	var _exp = boss_exp(global.boss_name)
	if global.player_lv != 20 && round(random(1)) = 1 && _exp != "0"
	{return ["* YOU WON!£", "* You earned "+_exp+" XP and 0 gold.£", "* Your LOVE increased."]}
	else {return ["* YOU WON!£", "* You earned "+_exp+" XP and 0 gold.", ""]}
}

function flee_dialog()
{
	var rand = floor(random_range(0, 8))
	if rand = 0 || rand = 1 {return ["* I@m outta here.", "", ""]}
	if rand = 2 {return ["* Don@t slow me down.", "", ""]}
	if rand = 3 {return ["* I@ve got better to do.", "", ""]}
	return ["* Escaped...", "", ""]
}

function death_dialog(nb)
{
	var rand = floor(random_range(0, 5))
	if nb = 1 {
		if rand = 0 {return ["Don@t lose hope!", "", ""]}
		if rand = 1 {return ["You@re going to  ", "be alright!", ""]}
		if rand = 2 {return ["Our fate rests  ", "upon you€€€", ""]}
		if rand = 3 {return ["It cannot end ", "now!", ""]}
		return ["You cannot give  ", "up just yet€€€", ""]
		}
	if nb = 2 {return [global.player_name+"!      ", "Stay determined€€€", ""]}
}

function item_dialog(item_index)
{
	if global.player_hp + item_heal_amount(oBattle.selected_item) >= global.player_max_hp
	{return ["* You ate the "+global.inventory[item_index]+".££££", "* Your HP was maxed out.", ""]}
	else
	{return ["* You ate the "+global.inventory[item_index]+".££££", "* You recovered "+string(item_heal_amount(global.inventory[selected_item]))+" HP!", ""]}
}