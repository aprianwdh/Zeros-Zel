extends Control

signal closed
signal opened
var isOpen = false
@onready var label_kayu = $NinePatchRect/GridContainer/kayu/Label_kayu
@onready var kayu = $NinePatchRect/GridContainer/kayu

func _process(delta):
	if GLobal_script.kayu_player > 0:
		kayu.show()
	else:
		kayu.hide()
	label_kayu.text = str(GLobal_script.kayu_player)

func open():
	show()
	print('open')
	isOpen = true
	opened.emit()
	
func close():
	hide()
	print("close")
	isOpen = false
	closed.emit()
