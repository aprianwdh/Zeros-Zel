extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	GLobal_script.current_sceen = 'island'
	if GLobal_script.current_quest == 'prolog1':
		$AnimationPlayer.play("prolog_1")
	elif GLobal_script.current_quest == 'prolog2':
		$AnimationPlayer.play("prolog_2")
	elif GLobal_script.current_quest == 'prolog3':
		$AnimationPlayer.play("prolog_3")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

	
func playIddleDown():
	$AnimatedSprite2D.play("iddle_down")
	
func playArise():
	$AnimatedSprite2D.play("die")
	
#func playWalk():
	#$AnimatedSprite2D.play("walk")


func _on_animation_player_animation_finished(anim_name):
	if anim_name == 'prolog_1':
		get_tree().change_scene_to_file('res://Sceens/world/island.tscn')
		GLobal_script.current_quest = 'prolog2'
	elif anim_name == 'prolog_2':
		get_tree().change_scene_to_file('res://Sceens/world/island.tscn')
		GLobal_script.current_quest = 'prolog3'
	elif anim_name == 'prolog_3':
		GLobal_script.current_quest = "chap1_1"
		get_tree().change_scene_to_file("res://Sceens/cutsceen/village_sceen.tscn")




