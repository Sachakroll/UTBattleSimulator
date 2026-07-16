// Nom

var colr = c_white
print("---£££Gamepad config£££---", 77, 28, colr)

if selected_option = 0 && !configurating {colr = c_yellow}
print("Exit", 145, 62, colr)
colr = c_white

// Options

var _txt = "Configure gamepad"
var _x = 93
if selected_option = 1 && !configurating {colr = c_yellow}
if !global.gamepad_detected {colr = make_colour_rgb(95, 95, 95)
	_txt = "No gamepad"
	_x = 120}
print(_txt, _x, 84, colr)
colr = c_white

// Configuration

var cf_txt = ""
if configurating
{
	if config_step = 0 {cf_txt = "Press the CONFIRM button."}
	if config_step = 1 {cf_txt = "Press the CANCEL button."}
	if config_step = 2 {cf_txt = "Go right."}
	if config_step = 3 {cf_txt = "Go up."}
}

if sinceconfig_timer < donemessage_time && !configurating
{cf_txt = "Configuration done!"}

print(cf_txt, 16, 213, c_white)

// Box

draw_sprite_stretched(sDialog_box_transp, 0, 160-box_width/2, box_top, box_width, box_height)