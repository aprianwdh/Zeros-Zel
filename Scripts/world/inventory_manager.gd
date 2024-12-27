extends CanvasLayer

@onready var inventory_gui = $inventory_gui
@onready var pause_menu = $pause_menu
@onready var map = $map

func _ready():
	inventory_gui.close()
	pause_menu.close()
	map.close()

func _input(event):
	if event.is_action_pressed("open_inventory"):

		if inventory_gui.isOpen:
			inventory_gui.close()
		else :
			inventory_gui.open()
			
	if event.is_action_pressed("pause"):
		if pause_menu.isOpen:
			pause_menu.close()
		else :
			pause_menu.open()
			
	if event.is_action_pressed("map"):
		if map.isOpen:
			map.close()
		else :
			map.open()
