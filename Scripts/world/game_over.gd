extends CanvasLayer


# Called when the node enters the scene tree for the first time.
func _ready():
	GLobal_script.restart_game = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_restart_pressed():
	GLobal_script.restart_game = true
	GLobal_script.load()
	get_tree().change_scene_to_file("res://Sceens/world/forest.tscn")


func _on_quit_pressed():
	get_tree().quit()
