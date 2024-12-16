extends Node

# Variabel global
var transisi_sceen = false
var current_sceen = 'world'
var last_position_player_x
var last_position_player_y
var load_position_player = false
var have_sword = false
var have_axe = false
var have_torch = false
var torch_player = 0
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
var kayu_player = 0
var current_weapon = 'hand'
var exp_player = 0
var level_player = 1
var exp_threshold = [0, 50, 100, 150, 200, 250]
var light_on = false
var save_path = "user://variabel.save"
var current_quest = 'prolog1'


func _ready():
	light_on = false

# Fungsi untuk Game Over
func Game_Over():
	get_tree().change_scene_to_file("res://Sceens/world/game_over.tscn")

func save_position_player(positionx,positiony):
	last_position_player_x = positionx
	last_position_player_y = positiony


# Fungsi untuk proses tiap frame
func _process(_delta):
	if current_sceen == 'world' and current_music != 'main':
		AudioManager.stop_cave()
		AudioManager.play_main()
		current_music = 'main'
	elif (current_sceen == 'cave' or current_sceen == 'cave2') and current_music != 'cave':
		AudioManager.stop_main()
		AudioManager.play_cave()
		current_music = 'cave'


# Fungsi untuk menambah item ke inventory
func add_item_to_inventory(item):
	for i in range(min(inventory.size(), max_inventory_size)):
		if inventory[i] == null:
			inventory[i] = item

	if inventory.size() < max_inventory_size:
		inventory.append(item)
	else:
		print("Inventory full")


# Fungsi untuk mendapatkan inventory
func get_inventory():
	return inventory


# Fungsi untuk menambah EXP
func gain_exp(amount: int):
	exp_player += amount
	while exp_player >= exp_threshold[level_player] and level_player < 5:
		exp_player -= exp_threshold[level_player]
		level_player += 1


# Fungsi untuk menyalakan cahaya pemain
func ligh_player_on():
	if light_on == false and torch_player > 0:
		light_on = true
		torch_player -= 1
		if torch_player <= 0:
			have_torch = false
		await get_tree().create_timer(12).timeout
		light_on = false


# Fungsi untuk menyimpan data
func save():
	# Kumpulkan semua data yang ingin disimpan ke dalam Dictionary
	var save_data = {
		"transisi_sceen": transisi_sceen,
		"current_sceen": current_sceen,
		"last_position_player_x": last_position_player_x,
		"last_position_player_y": last_position_player_y,
		"load_position_player": load_position_player,
		"have_sword": have_sword,
		"have_axe": have_axe,
		"have_torch": have_torch,
		"torch_player": torch_player,
		"is_Game_Over": is_Game_Over,
		"restart_game": restart_game,
		"current_music": current_music,
		"health_player": health_player,
		"inventory": inventory,
		"inven_nomor": inven_nomor,
		"cutseen_cave_1": cutseen_cave_1,
		"coin_player": coin_player,
		"kayu_player": kayu_player,
		"current_weapon": current_weapon,
		"exp_player": exp_player,
		"level_player": level_player,
		"light_on": light_on,
		"current_quest":current_quest
	}

	# Simpan Dictionary ke file
	var file = FileAccess.open(save_path, FileAccess.WRITE)
	if file:
		file.store_var(save_data)  # Menulis data ke file
		file.close()
		print("Game saved successfully!")
	else:
		print("Failed to save game.")


# Fungsi untuk memuat data
func load():
	if FileAccess.file_exists(save_path):
		var file = FileAccess.open(save_path, FileAccess.READ)
		if file:
			var load_data = file.get_var()  # Membaca Dictionary dari file
			file.close()

			# Tetapkan kembali data ke variabel global
			transisi_sceen = load_data["transisi_sceen"]
			current_sceen = load_data["current_sceen"]
			last_position_player_x = load_data["last_position_player_x"]
			last_position_player_y = load_data["last_position_player_y"]
			load_position_player = load_data["load_position_player"]
			have_sword = load_data["have_sword"]
			have_axe = load_data["have_axe"]
			have_torch = load_data["have_torch"]
			torch_player = load_data["torch_player"]
			is_Game_Over = load_data["is_Game_Over"]
			restart_game = load_data["restart_game"]
			current_music = load_data["current_music"]
			health_player = load_data["health_player"]
			inventory = load_data["inventory"]
			inven_nomor = load_data["inven_nomor"]
			cutseen_cave_1 = load_data["cutseen_cave_1"]
			coin_player = load_data["coin_player"]
			kayu_player = load_data["kayu_player"]
			current_weapon = load_data["current_weapon"]
			exp_player = load_data["exp_player"]
			level_player = load_data["level_player"]
			light_on = load_data["light_on"]
			current_quest = load_data["current_quest"]

			print("Game loaded successfully!")
		else:
			print("Failed to load game.")
	else:
		print("Save file not found.")
