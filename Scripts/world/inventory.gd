extends CanvasLayer

func _process(_delta):
	if GLobal_script.have_sword == true:
		$Control/HBoxContainer/slot1.show()
	if GLobal_script.have_axe == true:
		$Control/HBoxContainer/slot2.show()
	if GLobal_script.have_torch == true:
		$Control/HBoxContainer/slot3.show()
	if GLobal_script.have_torch == false:
		$Control/HBoxContainer/slot3.hide()


func _on_slot_1_pressed():
	GLobal_script.current_weapon = 'sword'


func _on_slot_2_pressed():
	GLobal_script.current_weapon = 'axe'


func _on_slot_3_pressed():
	GLobal_script.ligh_player_on()
	
