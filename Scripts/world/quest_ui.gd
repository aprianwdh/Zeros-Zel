extends CanvasLayer

@onready var quest_label = $TextureRect/quest_label
signal close

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if GLobal_script.current_quest == 'prolog2':
		quest_label.text = 'Berkeliling pulau untuk mendapatkan perunjuk'
	elif GLobal_script.current_quest == 'prolog3':
		quest_label.text = 'Carilah 10 Kayu untuk memperbaiki kapal'
	elif GLobal_script.current_quest == 'chap1_1':
		quest_label.text = 'Pergilah ke Panti Asuhan untuk menemui Kakek dan yang lain'


func _on_texture_button_pressed():
	$".".hide()
	emit_signal("close")
