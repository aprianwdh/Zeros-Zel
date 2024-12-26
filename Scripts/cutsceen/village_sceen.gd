extends Node2D
@onready var cutsceen = $cutsceen


# Called when the node enters the scene tree for the first time.
func _ready():
	if GLobal_script.current_quest == 'chap1_1':
		cutsceen.play("chap1_1")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_cutsceen_animation_libraries_updated():
	pass # Replace with function body.


func _on_cutsceen_animation_finished(anim_name):
	if anim_name == "chap1_1":
		get_tree().change_scene_to_file("res://Sceens/world/village.tscn")
