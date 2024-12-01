extends CharacterBody2D


const SPEED = 300

func _physics_process(delta):
	move_player(delta)
	
func move_player(_delta):
	var direction = Input.get_vector('ui_left','ui_right','ui_up','ui_down')
	velocity = direction * SPEED
	move_and_slide()
