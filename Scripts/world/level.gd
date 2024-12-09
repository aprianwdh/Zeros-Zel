extends TextureRect


# Called when the node enters the scene tree for the first time.
func _ready():
	level_update()
	update_exp_bar()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	level_update()
	update_exp_bar()
	
func level_update():
	$Label.text = 'Lv '+str(GLobal_script.level_player)

func update_exp_bar():
	$exp_bar.max_value = GLobal_script.exp_threshold[GLobal_script.level_player]
	$exp_bar.value = GLobal_script.exp_player
	

