extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	print(GLobal_script.current_quest)
	#if GLobal_script.current_quest == ''
	if GLobal_script.current_quest == 'prolog3':
		$TileMap/Player.position.x = 424
		$TileMap/Player.position.y = 144
		$kayu.show()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_prolog_2_area_body_entered(body):
	if body.is_in_group("Player"):
		if GLobal_script.current_quest == "prolog2":
			# Gunakan deferred call untuk mengganti scene dengan aman
			call_deferred("_change_scene")
			$prolog2_area.disable_mode


func _change_scene():
	get_tree().change_scene_to_file("res://Sceens/cutsceen/prolog_1.tscn")
	
	

func _on_inventory_gui_closed():
	get_tree().paused = false


func _on_inventory_gui_opened():
	get_tree().paused = true


func _on_pause_menu_closed_pause_menu():
	get_tree().paused = false


func _on_pause_menu_opened_pause_menu():
	get_tree().paused = true


func _on_prolog_3_area_body_entered(body):
	if body.is_in_group("Player"):
		print("masuk area prolog 3")
		if GLobal_script.current_quest == 'prolog3' and GLobal_script.kayu_player == 10:
			print("kayu sudah 10")
			GLobal_script.kayu_player = 0
			call_deferred("_change_scene")
