extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	#$RichTextLabel2.horizontal_alignment = RichTextLabel.ALIGN_CENTER
	GLobal_script.current_sceen = "end"
	pass



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_animation_player_animation_finished(anim_name):
	if anim_name == "Credit-Sceen":
		get_tree().change_scene_to_file("res://Sceens/world/main_menu.tscn")
