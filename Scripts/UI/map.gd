extends TextureRect

signal closed_map
signal opened_map
var isOpen = false
#@onready var label_kayu = $NinePatchRect/GridContainer/kayu/Label_kayu
#@onready var kayu = $NinePatchRect/GridContainer/kayu
@onready var player = $AnimatedSprite2D

func _process(delta):
	if GLobal_script.current_sceen == 'world':
		player.show()
		player.position.x = 92
		player.position.y = 60
	elif GLobal_script.current_sceen == 'city':
		player.show()
		player.position.x = 92
		player.position.y = 28
	elif GLobal_script.current_sceen == 'forest':
		player.show()
		player.position.x = 92
		player.position.y = 92
	else :
		player.hide()
	
	

func open():
	show()
	print('open')
	isOpen = true
	opened_map.emit()
	
func close():
	hide()
	print("close")
	isOpen = false
	closed_map.emit()
	
