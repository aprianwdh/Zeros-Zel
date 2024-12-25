extends Node2D

@onready var cutsceen_city = $cutsceen_city

# Called when the node enters the scene tree for the first time.
func _ready():
	if GLobal_script.current_quest == "chap1_3":
		cutsceen_city.play("chap1_3")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_cutsceen_city_animation_finished(anim_name):
	if anim_name == "chap1_3":
		GLobal_script.current_quest = "chap1_4"
		get_tree().change_scene_to_file("res://Sceens/world/city.tscn")
