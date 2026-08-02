function boss_get_name(boss_id)
{
	if boss_id = 0 {return "Toriel"}
	if boss_id = 1 {return "Papyrus"}
	if boss_id = 2 {return "Sans"}
	return "[Error]"
}

function music_from_boss(_boss_name)
{
	if _boss_name = "Toriel" {return mus_boss_toriel}
	if _boss_name = "Papyrus" {return mus_boss_papyrus}
	if _boss_name = "Undyne" {return mus_boss_undyne}
	if _boss_name = "Asgore" {return mus_boss_asgore}
	if _boss_name = "Sans" {return mus_boss_sans}
	return -1
}

function sprite_from_boss(_boss_name)
{
	if _boss_name = "Toriel" {return sBoss_toriel}
	if _boss_name = "Papyrus" {return sBoss_papyrus}
	if _boss_name = "Sans" {return sBoss_sans}
}

function boss_exp(_boss_name)
{
	switch _boss_name
	{
		case "Toriel" : return "150"
		case "Papyrus" : return "200"
		case "Undyne" : return "500"
		case "Mettaton" : return "800"
		default : return "0"
	}
}