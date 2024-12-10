extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready():
	if GLobal_script.have_torch == true:
		queue_free()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_body_entered(body):
	if body.is_in_group("Player") :
		GLobal_script.have_torch = true
		GLobal_script.torch_player += 1
		queue_free()
