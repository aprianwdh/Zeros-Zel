extends Node2D

#func _ready():
	##GLobal_script.current_sceen = 'cave'
	#$AnimationPlayer.play("fade_out")
	#GLobal_script.load_position_player = true
	#GLobal_script.last_position_player_x = 311
	#GLobal_script.last_position_player_y = 169
	
func _ready():
	$fade_transisi.play("fade_out")






func change_Sceen():
	if GLobal_script.transisi_sceen == true :
		if GLobal_script.current_sceen == 'village':
			get_tree().change_scene_to_file('res://Sceens/world/village.tscn')




func _on_area_2d_body_entered(body):
	if body.is_in_group("Player"):
		GLobal_script.current_sceen = 'village'
		GLobal_script.transisi_sceen = true
		GLobal_script.load_position_player = true
		call_deferred("change_Sceen")


func _on_area_2d_body_exited(body):
	if body.is_in_group("Player"):
		GLobal_script.transisi_sceen = false

