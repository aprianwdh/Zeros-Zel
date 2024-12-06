extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	#GLobal_script.load_position_player = false #opsional
	$TileMap.show()
	$AnimationPlayer.play("fade_out")
	GLobal_script.current_sceen = 'world'
	if GLobal_script.load_position_player:
		$TileMap/Player.position = Vector2(GLobal_script.last_position_player_x,GLobal_script.last_position_player_y)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	change_Sceen()


func _on_area_2d_body_entered(body):
	print("in")
	if body.is_in_group("Player"):
		GLobal_script.transisi_sceen = true
		#$TileMap.hide()
		#$AnimationPlayer.play("fade_in")
		#await $AnimationPlayer.animation_finished
		#change_Sceen()


func _on_area_2d_body_exited(body):
	print("out")
	if body.is_in_group("Player"):
		GLobal_script.transisi_sceen = false
		
func change_Sceen():
	if GLobal_script.transisi_sceen == true:
		if GLobal_script.current_sceen == 'world':
			get_tree().change_scene_to_file("res://Sceens/world/cave_test.tscn")
		elif GLobal_script.current_sceen == 'cave2':
			get_tree().change_scene_to_file("res://Sceens/world/cave_test_2.tscn")





func _on_cave_2_body_entered(body):
	if body.is_in_group("Player"):
		GLobal_script.current_sceen = 'cave2'
		GLobal_script.transisi_sceen = true


func _on_cave_2_body_exited(body):
	if body.is_in_group("Player"):
		GLobal_script.transisi_sceen = false
