extends Node2D

var text_buble = false
# Called when the node enters the scene tree for the first time.
func _ready():
	if text_buble :
		$buble_chat.queue_free()
	print(GLobal_script.current_quest)
	if GLobal_script.current_quest == 'prolog3':
		$cutsceen.play("chapter_1_1")
	#GLobal_script.load_position_player = false #opsional
	$TileMap.show()
	$fade_transisi.play("fade_out")
	GLobal_script.current_sceen = 'boss'
	
	#if GLobal_script.load_position_player:
		#$TileMap/Player.position = Vector2(GLobal_script.last_position_player_x,GLobal_script.last_position_player_y)

func _process(delta):
	if GLobal_script.have_sword and GLobal_script.level_player <= 2 and GLobal_script.current_quest == "chap1_5":
		GLobal_script.current_quest = "chap1_6"



func _on_inventory_gui_closed():
	get_tree().paused = false


func _on_inventory_gui_opened():
	get_tree().paused = true


func _on_pause_menu_closed_pause_menu():
	get_tree().paused = false


func _on_pause_menu_opened_pause_menu():
	get_tree().paused = true


func _on_cutsceen_animation_finished(anim_name):
	if anim_name == "chapter_1_1":
		GLobal_script.current_quest = 'chap1_1'
		text_buble = true


func _on_boss_jawir_boss_kalah():
	print("Boss Kalah")
	$fade_transisi.play("fade_in")
	await get_tree().create_timer(1).timeout
	get_tree().change_scene_to_file("res://Sceens/world/credit_sceen.tscn")
