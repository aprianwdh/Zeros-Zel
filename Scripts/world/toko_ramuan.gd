extends Area2D

signal toko_ramuan_interact
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("interact") and GLobal_script.interact == "toko_ramuan":
		emit_signal("toko_ramuan_interact")


func _on_body_entered(body):
	if body.is_in_group("Player"):
		GLobal_script.interact = "toko_ramuan"


func _on_body_exited(body):
	if body.is_in_group("Player"):
		GLobal_script.interact = ''
