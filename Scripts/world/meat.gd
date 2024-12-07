extends "res://Scripts/world/items.gd"

var healt_to_restore = 5

func _ready():
	item_texture = preload("res://Assets/world/M_Idle.png")
	
func use():
	GLobal_script.health_player += healt_to_restore
	queue_free()


func _on_body_entered(body):
	if body.is_in_group("Player"):
		GLobal_script.ITEM = "res://Assets/world/M_Idle.png"
		queue_free()
