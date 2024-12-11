extends PointLight2D


# Called when the node enters the scene tree for the first time.
func _ready():
	GLobal_script.light_on = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if GLobal_script.light_on == true:
		$".".visible = true
	else :
		$".".visible = false
