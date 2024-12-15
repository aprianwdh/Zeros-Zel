extends Control

signal closed_pause_menu
signal opened_pause_menu
var isOpen = false

func open():
	show()
	print('open')
	isOpen = true
	opened_pause_menu.emit()
	
func close():
	hide()
	print("close")
	isOpen = false
	closed_pause_menu.emit()


func _on_continue_pressed():
	close()


func _on_quest_pressed():
	$quest_ui.show()
	$".".hide()
	
func _on_exit_pressed():
	get_tree().quit()


func _on_quest_ui_close():
	$".".show()
