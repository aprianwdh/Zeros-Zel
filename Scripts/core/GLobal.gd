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
var health_player = 100
var inventory = []
var max_inventory_size = 4
var inven_nomor = 1
var ITEM
var cutseen_cave_1 = false
var coin_player = 0


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

func add_item_to_inventory(item):
	for i in range(min(inventory.size(), max_inventory_size)):
		if inventory[i] == null:
			inventory[i] = item
			
	if inventory.size() < max_inventory_size:
		inventory.append(item)
	else :
		print("Inventory full")
		
func get_inventory():
	return inventory

func update_inven():
	pass
