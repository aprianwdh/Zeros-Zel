extends CanvasLayer

@onready var menu_jual = $MENU_JUAL
@onready var menu_beli = $MENU_BELI
@onready var menu_awal = $MENU_AWAL
signal quit_toko_senjata
@onready var label_coin = $Label_coin
@onready var kayu_player = $MENU_JUAL/kayu/kayu_player

# Called when the node enters the scene tree for the first time.
func _ready():
	menu_beli.hide()
	menu_jual.hide()
	menu_awal.show()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	label_coin.text = str(GLobal_script.coin_player)
	kayu_player.text = str(GLobal_script.kayu_player)


func _on_button_beli_pressed():
	menu_beli.show()
	menu_awal.hide()


func _on_button_jual_pressed():
	menu_jual.show()
	menu_awal.hide()


func _on_quit_pressed():
	emit_signal("quit_toko_senjata")
	menu_beli.hide()
	menu_jual.hide()
	menu_awal.show()



func _on_jual_kayu_button_pressed():
	if GLobal_script.kayu_player > 0:
		GLobal_script.kayu_player -= 1
		GLobal_script.coin_player += 5
