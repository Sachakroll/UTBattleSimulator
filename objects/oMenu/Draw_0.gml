// Nom

var colr = c_white
print("Name the fallen human.", 75, 102, c_white)

if global.menu_selected_option = 0 {colr = c_yellow}
var name_str = global.player_name
for (i = 0 ; i < 6-string_length(global.player_name) ; i++) {name_str += "_"}
print(name_str, 137, 118, colr)
colr = c_white

// Commencer

if global.player_name = "" {colr = make_colour_rgb(95, 95, 95)}
if global.menu_selected_option = 1 {colr = c_yellow}
print("Start the fight", 101, 148, colr)
colr = c_white

// Options

if global.menu_selected_option = 2 {colr = c_yellow}
print("Settings", 129, 171, colr)
colr = c_white

if global.menu_selected_option = 3 {colr = c_yellow}
print("Gamepad settings", 97, 194, colr)
colr = c_white