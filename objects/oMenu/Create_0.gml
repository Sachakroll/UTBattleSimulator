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