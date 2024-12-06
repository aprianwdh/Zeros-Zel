extends Node

var transisi_sceen = false
var current_sceen = 'world'
var last_position_player_x
var last_position_player_y
var load_position_player = false
var have_sword = false
var is_Game_Over = false
var restart_game = false
var current_music = ''

func Game_Over():
	get_tree().change_scene_to_file("res://Sceens/world/game_over.tscn")
	
func _process(delta):
	if current_sceen == 'world' and current_music != 'main':
		AudioManager.stop_cave()
		AudioManager.play_main()
		current_music = 'main'
	elif (current_sceen == 'cave' or current_sceen == 'cave2') and current_music !='cave':
		AudioManager.stop_main()
		AudioManager.play_cave()
		current_music = 'cave'
