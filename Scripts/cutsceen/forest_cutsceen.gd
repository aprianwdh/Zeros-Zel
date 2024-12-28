extends Node2D
@onready var cutsceen = $cutsceen

# Called when the node enters the scene tree for the first time.
func _ready():
	cutsceen.play("chap1_6")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_cutsceen_animation_finished(anim_name):
	if anim_name == 'chap1_6':
		GLobal_script.current_quest = "chap_bos"
		get_tree().change_scene_to_file("res://Sceens/world/forest.tscn")
