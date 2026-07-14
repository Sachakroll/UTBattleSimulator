// Nom

var colr = c_white

if selected_option = 0 {colr = c_yellow}
print("Exit", 137, 108, colr)
colr = c_white

// Options

if selected_option = 1 {colr = c_yellow}
print("Player LV :", 120, 170, c_white)
print("<    >", 218, 170, colr)
print(global.player_lv, 237-4*(global.player_lv>9), 170, colr)
colr = c_white

if selected_option = 2 {colr = c_yellow}
print("Player attack strength :", 31, 184, c_white)
print(string(global.atk_strength)+"%", 230, 184, colr)
colr = c_white