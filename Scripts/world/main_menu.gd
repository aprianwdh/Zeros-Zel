extends CanvasLayer


# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimationPlayer.play("fade_out")
	GLobal_script.current_sceen = 'world'
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_play_pressed():
	GLobal_script.restart_game = true
	get_tree().change_scene_to_file('res://Sceens/world/test_level.tscn')


func _on_quit_pressed():
	get_tree().quit()
