extends Area2D



func _on_body_entered(body):
	if body.is_in_group("Player"):
		GLobal_script.current_sceen = 'village'
		GLobal_script.transisi_sceen = true
		GLobal_script.load_position_player = true
		call_deferred("change_Sceen")


func _on_body_exited(body):
	if body.is_in_group("Player"):
		GLobal_script.transisi_sceen = false
		
func change_Sceen():
	if GLobal_script.transisi_sceen == true :
		if GLobal_script.current_sceen == 'village':
			get_tree().change_scene_to_file('res://Sceens/world/village.tscn')
