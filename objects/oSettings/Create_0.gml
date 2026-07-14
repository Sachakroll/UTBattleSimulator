selected_option = 0

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