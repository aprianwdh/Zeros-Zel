extends CanvasLayer

func _process(_delta):
	if GLobal_script.have_sword == true:
		$Control/HBoxContainer/slot1.show()
	if GLobal_script.have_axe == true:
		$Control/HBoxContainer/slot2.show()


func _on_slot_1_pressed():
	GLobal_script.current_weapon = 'sword'


func _on_slot_2_pressed():
	GLobal_script.current_weapon = 'axe'
