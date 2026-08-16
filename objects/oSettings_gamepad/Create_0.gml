selected_option = 0
configurating = false
config_step = 0
donemessage_time = 90
sinceconfig_timer = donemessage_time+1
global.config_done = false

box_top = 110
box_height = 90
box_width = 108

instance_create_layer(160, box_top-1+box_height/2, "Instances", oConfig_soul)