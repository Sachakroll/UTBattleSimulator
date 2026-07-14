var dx = x-global.death_soul_x
var dy = y-global.death_soul_y

hsp = dx/3 + random_range(-0.5, 0.5)
vsp = dy/3 + random_range(-3, -1)

gravity_force = 0.04

if global.soulmode = 0
{sprite_index = sSoul_fragment_red}
if global.soulmode = 1
{sprite_index = sSoul_fragment_blue}

image_index = 0
image_speed = 1