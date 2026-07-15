// Nom

var colr = c_white

if selected_option = 0 && !configurating {colr = c_yellow}
print("Exit", 107, 78, colr)
colr = c_white

// Options

var _txt = "Configure controller"
var _x = 108
if selected_option = 1 && !configurating {colr = c_yellow}
if !global.gamepad_detected {colr = make_colour_rgb(95, 95, 95)
	_txt = "No controller"
	_x = 108}
print(_txt, _x, 108, colr)
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

print(cf_txt, 12, 214, c_white)

// Box

draw_sprite_stretched(sDialog_box_transp, 0, 160-box_width/2, box_top, box_width, box_height)