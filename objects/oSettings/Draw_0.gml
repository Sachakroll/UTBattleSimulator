// Settings

var colr = c_white
print("---£££Settings£££---", 102, 16, colr)

if selected_option = 0 {colr = c_yellow}
print("Exit", 145, 36, colr)
colr = c_white

// Human stats

print("HUMAN STATS", 117, 58, colr)

if selected_option = 1 {colr = c_yellow}
print("LV :", 140, 76, c_white)
print("<     >", 177, 76, colr)
print(global.player_lv, 200-4*(global.player_lv>9), 76, colr)
colr = c_white

if selected_option = 2 {colr = c_yellow}
print("Attack strength :", 36, 90, c_white)
print("<     >", 177, 90, colr)
print(string(global.atk_strength)+"%", 192-4*(global.atk_strength>99)+4*(global.atk_strength<10), 90, colr)
colr = c_white

if selected_option = 3 {colr = c_yellow}
print("Items :", 115, 104, colr)
print("<     >", 177, 104, colr)
print(string(global.player_items), 200, 104, colr)
colr = c_white

// Monster stats

print("MONSTER STATS", 109, 126, colr)

if selected_option = 4 {colr = c_yellow}
print("HP :", 140, 144, c_white)
print("<     >", 177, 144, colr)
print(string(global.boss_max_hp), 200-4*(global.boss_max_hp>999)-4*(global.boss_max_hp>99)-4*(global.boss_max_hp>9), 144, colr)
colr = c_white

if selected_option = 5 {colr = c_yellow}
print("Turn duration :", 52, 158, c_white)
print("<     >", 177, 158, colr)
print(string(global.boss_turn_seconds)+"s", 192-4*(global.boss_turn_seconds>99)+4*(global.boss_turn_seconds<10), 158, colr)
colr = c_white

// Sound

print("AUDIO", 141, 180, colr)

if selected_option = 6 {colr = c_yellow}
print("Volume :", 107, 197, c_white)
print("<     >", 177, 197, colr)
print(string(int64(100*global.volume))+"%", 192-4*(global.volume>0.99)+4*(global.volume<0.10), 197, colr)
colr = c_white

if selected_option = 7 {colr = c_yellow}
print("Music : ", 115, 211, c_white)
print("<     >", 177, 211, colr)
if global.enable_music {print("ON", 195, 211, colr)}
else {print("OFF", 192, 211, colr)}
colr = c_white