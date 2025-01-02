extends Control

@onready var toko_senjata = $Toko_senjata
@onready var toko_ui = $"."
@onready var toko_ramuan = $Toko_ramuan

# Called when the node enters the scene tree for the first time.
func _ready():
	toko_senjata.hide()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_toko_senjata_toko_senjata_interact():
	toko_senjata.show()


func _on_toko_senjata_quit_toko_senjata():
	toko_senjata.hide()


func _on_toko_ramuan_toko_ramuan_interact():
	toko_ramuan.show()


func _on_toko_ramuan_quit_toko_senjata():
	toko_ramuan.hide()
