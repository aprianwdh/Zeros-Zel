extends Node2D

@onready var cutsceen = $AnimationPlayer

# Called when the node enters the scene tree for the first time.
func _ready():
	if GLobal_script.current_quest == 'chap1_1':
		cutsceen.play("chap1_1_panti")
	elif GLobal_script.current_quest == 'chap1_2':
		cutsceen.play("chap1_2_panti")
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_animation_player_animation_finished(anim_name):
	if anim_name == 'chap1_1_panti':
		GLobal_script.current_quest = 'chap1_2'
		get_tree().change_scene_to_file("res://Sceens/world/panti_asuhan_sceen.tscn")
	elif anim_name == 'chap1_2_panti':
		GLobal_script.current_quest = 'chap1_3'
		get_tree().change_scene_to_file("res://Sceens/world/panti_asuhan_sceen.tscn")
