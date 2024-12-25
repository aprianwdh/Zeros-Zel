extends Area2D
@onready var fade_transisi = $"../fade_transisi"

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
		if GLobal_script.current_sceen == 'panti_asuhan' and GLobal_script.current_quest == "chap1_1":
			get_tree().change_scene_to_file("res://Sceens/cutsceen/chap_1_1.tscn")
		elif GLobal_script.current_sceen == 'panti_asuhan' and GLobal_script.kayu_player >= 10:
			get_tree().change_scene_to_file("res://Sceens/cutsceen/chap_1_1.tscn")
		else:
			get_tree().change_scene_to_file('res://Sceens/world/panti_asuhan_sceen.tscn')



func _on_body_entered(body):
	if body.is_in_group("Player"):
		GLobal_script.current_sceen = 'panti_asuhan'
		GLobal_script.transisi_sceen = true
		GLobal_script.save_position_player(33,300)
		call_deferred("change_Sceen")


func _on_body_exited(body):
	if body.is_in_group("Player"):
		#GLobal_script.current_sceen = 'cave2'
		GLobal_script.transisi_sceen = false
