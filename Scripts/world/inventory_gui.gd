extends Control

signal closed
signal opened
var isOpen = false

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
