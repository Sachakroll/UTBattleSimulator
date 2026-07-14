visible = true

if fade_timer != -1
{
	if fade_timer < fade_time {image_alpha += 1/fade_time}
	if fade_timer = fade_time {image_alpha = 1
		room_goto(target_room)}
	if fade_timer > fade_time {image_alpha -= 1/fade_time}
	fade_timer ++
	if fade_timer >= 2*fade_time {fade_timer = -1}
}
else {image_alpha = 0}

if target_room = Battle || origin_room = Battle || origin_room = Death
{global.ubervolume = 1-image_alpha}