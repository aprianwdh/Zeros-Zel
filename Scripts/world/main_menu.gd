extends CanvasLayer


# Called when the node enters the scene tree for the first time.
func _ready():
	$fade_transisi.play("fade_out")
	GLobal_script.is_saving()
	$AnimationPlayer.play("fade_out")
	GLobal_script.current_sceen = 'world'
	if GLobal_script.saving == true:
		$CenterContainer/VBoxContainer/countinue.show()
	else :
		$CenterContainer/VBoxContainer/countinue.hide()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_play_pressed():
	GLobal_script.restart_game = true
	GLobal_script.delete_save()
	get_tree().change_scene_to_file('res://Sceens/cutsceen/prolog_1.tscn')


func _on_quit_pressed():
	get_tree().quit()


func _on_countinue_pressed():
	GLobal_script.load()
	if GLobal_script.current_quest == "chap1_6" or GLobal_script.current_quest == "chap_boss":
		get_tree().change_scene_to_file('res://Sceens/world/forest.tscn')
	else:
		get_tree().change_scene_to_file('res://Sceens/world/panti_asuhan_sceen.tscn')
