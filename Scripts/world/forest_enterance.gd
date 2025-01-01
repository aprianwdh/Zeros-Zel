extends Area2D
@onready var fade_transisi = $"../fade_transisi"
signal belum_boleh_ke_forest
#func _ready():
	##GLobal_script.current_sceen = 'cave'
	#$AnimationPlayer.play("fade_out")
	#GLobal_script.load_position_player = true
	#GLobal_script.last_position_player_x = 311
	#GLobal_script.last_position_player_y = 169






func change_Sceen():
	fade_transisi.play("fade_in")
	await fade_transisi.animation_finished
	if GLobal_script.transisi_sceen == true :
		if GLobal_script.current_sceen == "forest" and GLobal_script.current_quest == "chap1_6":
			get_tree().change_scene_to_file("res://Sceens/world/forest_cutsceen.tscn")
		else:
			emit_signal("belum_boleh_ke_forest")
			get_tree().change_scene_to_file("res://Sceens/world/forest.tscn")



func _on_body_entered(body):
	if body.is_in_group("Player"):
		GLobal_script.current_sceen = 'forest'
		GLobal_script.transisi_sceen = true
		GLobal_script.save_position_player(335,386)
		call_deferred("change_Sceen")


func _on_body_exited(body):
	if body.is_in_group("Player"):
		#GLobal_script.current_sceen = 'cave2'
		GLobal_script.transisi_sceen = false

