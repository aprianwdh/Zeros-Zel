extends StaticBody2D


# Called when the node enters the scene tree for the first time.
func _ready():
	if GLobal_script.current_quest == "chap1_2" or GLobal_script.current_quest == "chap1_1":
		pass
	else :
		queue_free()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
