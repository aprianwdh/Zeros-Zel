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
		quest_label.text = 'Pergilah ke Panti Asuhan untuk menemui Kakek dan yang lain (rumah yang ada tulisan "inn")'
	elif GLobal_script.current_quest == 'chap1_2':
		quest_label.text = 'Tebanglah 10 kayu (' + str(GLobal_script.kayu_player) +'/10) dan kembalilah ke Panti Asuhan'
	elif GLobal_script.current_quest == 'chap1_3':
		quest_label.text = 'Pergilah ke kota untuk menjual kayu (dibagian Utara pulau)'
	elif GLobal_script.current_quest == 'chap1_4':
		quest_label.text = 'Juallah kayu ke toko senjata dan kembalilah ke Panti Asuhan'
	elif GLobal_script.current_quest == 'chap1_5':
		quest_label.text = 'Beli Pedang di toko senjata dan capai level 2'
	elif GLobal_script.current_quest == 'chap1_6':
		quest_label.text = 'Pergilah ke Hutan di sebelah selatan (arah bawah map)'
	elif GLobal_script.current_quest == 'chap_boss':
		quest_label.text = 'Kalahkan Monster Jawir di Ujung Forest ini'


func _on_texture_button_pressed():
	$".".hide()
	emit_signal("close")
