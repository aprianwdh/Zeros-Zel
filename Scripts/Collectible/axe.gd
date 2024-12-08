extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready():
	if GLobal_script.have_axe == true:
		queue_free()



func _on_body_entered(body):
	if body.is_in_group("Player"):
		GLobal_script.have_axe = true
		GLobal_script.current_weapon = 'axe'
		queue_free()
