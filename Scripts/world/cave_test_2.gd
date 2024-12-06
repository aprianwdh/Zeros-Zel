extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	GLobal_script.current_sceen = 'cave'
	$AnimationPlayer.play("fade_out")
	GLobal_script.load_position_player = true
	GLobal_script.last_position_player_x = 57
	GLobal_script.last_position_player_y = 152


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	change_sceen()


func _on_area_2d_body_entered(body):
	if body.is_in_group("Player"):
		GLobal_script.transisi_sceen = true



func _on_area_2d_body_exited(body):
	if body.is_in_group("Player"):
		GLobal_script.transisi_sceen = false
	
func change_sceen():
	if GLobal_script.transisi_sceen == true:
		if GLobal_script.current_sceen == 'cave':
			get_tree().change_scene_to_file("res://Sceens/world/test_level.tscn")
