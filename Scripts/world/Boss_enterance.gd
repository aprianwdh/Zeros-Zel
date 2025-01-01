extends Area2D
@onready var fade_transisi = $"../fade_transisi"

#func _ready():
	##GLobal_script.current_sceen = 'cave'
	#$AnimationPlayer.play("fade_out")
	#GLobal_script.load_position_player = true
	#GLobal_script.last_position_player_x = 311
	#GLobal_script.last_position_player_y = 169






func change_Sceen():
	if GLobal_script.transisi_sceen == true :
		if GLobal_script.current_sceen == "boss" :
			print("Transisi berhasil")
			get_tree().change_scene_to_file("res://Sceens/world/boss_level.tscn")
		else:
			print("masuk ke alam baka")



func _on_body_entered(body):
	if body.is_in_group("Player"):
		print("masukke boss area")
		GLobal_script.current_sceen = 'boss'
		GLobal_script.transisi_sceen = true
		#GLobal_script.save_position_player(352,-139)
		call_deferred("change_Sceen")


func _on_body_exited(body):
	if body.is_in_group("Player"):
		#GLobal_script.current_sceen = 'cave2'
		GLobal_script.transisi_sceen = false

