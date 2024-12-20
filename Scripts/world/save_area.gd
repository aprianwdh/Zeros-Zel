extends Area2D

signal body_masuk_area
signal body_keluar_area
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("interact"):
		GLobal_script.save()
		$"../CanvasLayer".show()
		await get_tree().create_timer(1).timeout
		$"../CanvasLayer".hide()
		print("save_presed")


func _on_body_entered(body):
	if body.is_in_group("Player"):
		GLobal_script.interact = true
		emit_signal("body_masuk_area")



func _on_body_exited(body):
	if body.is_in_group("Player"):
		GLobal_script.interact = false
		emit_signal("body_keluar_area")
