extends CanvasLayer

@onready var menu_jual = $MENU_JUAL
@onready var menu_beli = $MENU_BELI
@onready var menu_awal = $MENU_AWAL
signal quit_toko_senjata
@onready var label_coin = $Label_coin
@onready var kayu_player = $MENU_JUAL/kayu/kayu_player
var harga_kayu = 10
@onready var sword = $MENU_BELI/sword_button
@onready var pickaxe = $MENU_BELI/pickaxe_button
@onready var pickaxe_button = $MENU_BELI/pickaxe_button
@onready var sword_button = $MENU_BELI/sword_button

# Called when the node enters the scene tree for the first time.
func _ready():
	menu_beli.hide()
	menu_jual.hide()
	menu_awal.show()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	label_coin.text = str(GLobal_script.coin_player)
	kayu_player.text = str(GLobal_script.kayu_player)
	
	if GLobal_script.coin_player >= 100:
		pickaxe_button.disabled = false
	else:
		pickaxe_button.disabled = true
		
	if GLobal_script.coin_player >= 150:
		sword_button.disabled = false
	else:
		sword_button.disabled = false
	
	if GLobal_script.have_sword == true:
		sword.hide()
	else:
		sword.show()


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
		GLobal_script.coin_player += harga_kayu


func _on_pickaxe_button_pressed():
	if GLobal_script.coin_player >= 100:
		pass


func _on_sword_button_pressed():
	if GLobal_script.coin_player >= 150:
		GLobal_script.coin_player -= 150
		GLobal_script.have_sword = true
