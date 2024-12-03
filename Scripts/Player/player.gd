extends CharacterBody2D

@onready var animasi_player = $AnimatedSprite2D

const SPEED = 2000
var last_direction = Vector2.ZERO

func _physics_process(delta):
	move_player(delta)
	update_animation(delta)
	
func move_player(delta):
	var direction = Input.get_vector('ui_left','ui_right','ui_up','ui_down')
	velocity = direction * SPEED * delta
	move_and_slide()
	
func update_animation(_delta):
	var direction = Input.get_vector('ui_left','ui_right','ui_up','ui_down')
	
	if direction != Vector2.ZERO:
		last_direction = direction
		
	if direction.x != 0 :
		animasi_player.play('walk_side')
	elif direction.y < 0 :
		animasi_player.play("walk_up")
	elif direction.y > 0 :
		animasi_player.play("walk_down")
	else:
		
		if last_direction.x != 0 :
			animasi_player.play("iddle_side")
		elif last_direction.y < 0 :
			animasi_player.play("iddle_up")
		elif last_direction.y > 0 :
			animasi_player.play("iddle_down")
			
	animasi_player.flip_h = last_direction.x < 0
	
	move_and_slide()
