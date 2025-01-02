extends CanvasLayer

func _process(_delta):
	$Control/HBoxContainer/slot3/toorch_counter.text = str(GLobal_script.torch_player)
	$Control/HBoxContainer/slot4/potion_counter.text = str(GLobal_script.red_potion)
	if GLobal_script.have_sword == true:
		$Control/HBoxContainer/slot1.show()
	if GLobal_script.have_axe == true:
		$Control/HBoxContainer/slot2.show()
	if GLobal_script.have_torch == true:
		$Control/HBoxContainer/slot3.show()
	if GLobal_script.have_torch == false:
		$Control/HBoxContainer/slot3.hide()
	if GLobal_script.red_potion > 0:
		$Control/HBoxContainer/slot4.show()
	if GLobal_script.red_potion <= 0:
		$Control/HBoxContainer/slot4.hide()
		


func _on_slot_1_pressed():
	GLobal_script.current_weapon = 'sword'


func _on_slot_2_pressed():
	GLobal_script.current_weapon = 'axe'


func _on_slot_3_pressed():
	GLobal_script.ligh_player_on()
	


func _on_slot_4_pressed():
	if GLobal_script.red_potion > 0: # Pastikan ada red potion
		if GLobal_script.health_player < 100: # Pastikan health player tidak penuh
			GLobal_script.health_player += 20
			GLobal_script.red_potion -= 1
			
			# Pastikan health tidak melebihi 100
			GLobal_script.health_player = min(GLobal_script.health_player, 100)
	else:
		print("Tidak ada red potion!")

