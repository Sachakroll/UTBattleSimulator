alphabet = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"

// Musique

if global.enable_music
{
	switch global.fights_won
	{
		case 0: global.music = mus_menu0 ; break
		case 1: global.music = mus_menu1 ; break
		case 2: global.music = mus_menu2 ; break
		case 3: global.music = mus_menu3 ; break
		case 4: global.music = mus_menu4 ; break
		case 5: global.music = mus_menu5 ; break
		default: global.music = mus_menu6 ; break
	}
}
else {global.music = -1}

// Fonction print

function print(_string, _x, _y, _color)
{
	var tab = string_to_number_array(_string)
	var rendered_text_length = 0
	for (var i = 0 ; i < string_length(_string) ; i++)
	{
		draw_sprite_ext(sN_letters, tab[i], _x+rendered_text_length, _y, 1, 1, 0, _color, 1)
		rendered_text_length += n_font_spacing(tab[i])
	}
}