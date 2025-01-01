extends CanvasLayer


# Called when the node enters the scene tree for the first time.
func _ready():
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
	get_tree().change_scene_to_file("res://Sceens/world/forest.tscn")
	#if GLobal_script.current_sceen == 'world':
		#get_tree().change_scene_to_file('res://Sceens/world/test_level.tscn')
	#elif GLobal_script.current_music == 'cave':
		#get_tree().change_scene_to_file('res://Sceens/world/cave_test.tscn')
	#else:
		#get_tree().change_scene_to_file('res://Sceens/world/test_level.tscn')
