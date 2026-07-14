function damage(bar_pos)
{
	var normalized_pos = (bar_pos-160)/320
	var _exp = exp(-20*sqr(normalized_pos))
	var rand = random_range(80, 100)
	
	if 160-10 < bar_pos && bar_pos < 160+10
	{rand += 10}
	if bar_pos = 160
	{rand = random_range(120, 130)}
	
	return int64(_exp*rand*global.atk_power/10)
}