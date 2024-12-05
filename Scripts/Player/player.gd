extends CharacterBody2D

@onready var animasi_player = $AnimationPlayer

const SPEED = 2000
var last_direction = Vector2.ZERO
@export var can_attck = false

var health_player = 100
var death_player = false

func _ready():
	animasi_player.play("iddle_down")
	last_direction.y = 1
func _physics_process(delta):
	if death_player == false:
		move_player(delta)
		update_animation(delta)
		animasi_attack()
	
func move_player(delta):
	var direction = Input.get_vector('left','right','up','down')
	velocity = direction * SPEED * delta
	move_and_slide()
	
func update_animation(_delta):
	var direction = Input.get_vector('left','right','up','down')
	
	if direction != Vector2.ZERO:
		last_direction = direction
	
	if can_attck == false:
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
			
	$AnimatedSprite2D.flip_h = last_direction.x < 0
	
	move_and_slide()

func animasi_attack():
	var direction = Input.get_vector('left','right','up','down')
	
	if direction != Vector2.ZERO:
		last_direction = direction
	
	if Input.is_action_just_pressed('attack') :
		can_attck = true
		if can_attck:
			if direction.x != 0 :
				animasi_player.play('atack_side')
			elif direction.y < 0 :
				animasi_player.play("atack_up")
			elif direction.y > 0 :
				animasi_player.play("atack_down")
			else:
				if last_direction.x != 0 :
					animasi_player.play("atack_side")
				elif last_direction.y < 0 :
					animasi_player.play("atack_up")
				elif last_direction.y > 0 :
					animasi_player.play("atack_down")
					
			$AnimatedSprite2D.flip_h = last_direction.x < 0
			if last_direction.x < 0 :
				$attack_area/CollisionShape2D.position = Vector2(-11,4)
			else:
				$attack_area/CollisionShape2D.position = Vector2(11,4)
	
	#move_and_slide()


func _on_attack_area_body_entered(body):
	if body.has_method('attacked'):
		body.attacked()
		
func attacked_player():
	if death_player == false:
		health_player -= 20
		$AnimatedSprite2D.modulate = Color(1, 0.5, 0.5)  # Flash merah
		await get_tree().create_timer(0.1).timeout  # Tunggu 0.1 detik
		$AnimatedSprite2D.modulate = Color(1, 1, 1)  # Kembali normal

		if health_player <= 0:
			death_player = true
			die_player()
		
func die_player():
	if death_player == true :
		animasi_player.play("die")
		await animasi_player.animation_finished
		#queue_free()
