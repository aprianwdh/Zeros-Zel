extends CanvasLayer


func _process(_delta):
	$TextureRect/Label.text = str(GLobal_script.coin_player)
