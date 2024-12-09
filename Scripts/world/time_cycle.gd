extends CanvasModulate


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	var time_of_day = fmod(GlobalTime.global_time,24.0)
	
	if time_of_day >= 6.0 and time_of_day < 18.0:
		$".".visible = false
	else:
		$".".visible = true
