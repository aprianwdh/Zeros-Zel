extends CharacterBody2D

@onready var animasi_player = $AnimationPlayer
@onready var icon_interact = $Icon_interact

var SPEED = 2000
var dash_cooldown = true
var last_direction = Vector2.ZERO
@export var can_attck = false
@onready var dash_timer = $dash_timer
@onready var particles= $GPUParticles2D
@onready var stamina_bar = $stamina_bar


var death_player = false
var coldown_attack = false

func _ready():
	if GLobal_script.load_position_player:
		$".".global_position = Vector2(GLobal_script.last_position_player_x,GLobal_script.last_position_player_y)
		GLobal_script.load_position_player = false
	update_health_bar()
	if GLobal_script.restart_game == true:
		GLobal_script.health_player = 100
		update_health_bar()
		#GLobal_script.have_sword = false
		GLobal_script.restart_game = false
	animasi_player.play("iddle_down")
	last_direction.y = 1
func _physics_process(delta):
	if death_player == false:
		dash()
		move_player(delta)
		update_animation(delta)
		animasi_attack()
		update_icon_interact()
		update_satmina_bar()
		update_stamina()
	
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
	
	if Input.is_action_just_pressed('attack') and GLobal_script.current_weapon != 'hand':
		can_attck = true
		if can_attck and GLobal_script.current_weapon == 'sword':
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
		elif can_attck and GLobal_script.current_weapon == 'axe':
			if direction.x != 0 :
				animasi_player.play('axe_side')
			elif direction.y < 0 :
				animasi_player.play("axe_up")
			elif direction.y > 0 :
				animasi_player.play("axe_down")
			else:
				if last_direction.x != 0 :
					animasi_player.play("axe_side")
				elif last_direction.y < 0 :
					animasi_player.play("axe_up")
				elif last_direction.y > 0 :
					animasi_player.play("axe_down")
					
		$AnimatedSprite2D.flip_h = last_direction.x < 0
		if last_direction.x < 0 :
			$attack_area/CollisionShape2D.position = Vector2(-11,4)
		else:
			$attack_area/CollisionShape2D.position = Vector2(11,4)
		await animasi_player.animation_finished
			#AudioManager.sword_play()
	
	#move_and_slide()


func _on_attack_area_body_entered(body):
	if body.has_method('attacked') and GLobal_script.current_weapon != 'hand':
		body.attacked()
		
func attacked_player():
	if death_player == false and coldown_attack == false:
		coldown_attack = true
		GLobal_script.health_player -= 20
		update_health_bar()
		$AnimatedSprite2D.modulate = Color(1, 0.5, 0.5)  # Flash merah
		await get_tree().create_timer(0.1).timeout  # Tunggu 0.1 detik
		$AnimatedSprite2D.modulate = Color(1, 1, 1)  # Kembali normal
		await get_tree().create_timer(0.2).timeout
		coldown_attack = false

		if GLobal_script.health_player <= 0:
			death_player = true
			die_player()
		
func die_player():
	if death_player == true :
		animasi_player.play("die")
		await animasi_player.animation_finished
		GLobal_script.Game_Over()
		
func update_health_bar():
	$"health bar/TextureRect/ProgressBar".value = GLobal_script.health_player

func update_icon_interact():
	if GLobal_script.interact != '':
		icon_interact.show()
		icon_interact.play("default")
	else :
		icon_interact.hide()
		
func dash():
	if Input.is_action_just_pressed("dash") and GLobal_script.stamina >= 50:
		dash_cooldown = false
		if !dash_cooldown:
			dash_timer.start()
			GLobal_script.stamina -= 50  # Mengurangi stamina
			particles.emitting = true
			SPEED = SPEED * 3
		if !stamina_bar.visible:
			stamina_bar.visible = true
			await get_tree().create_timer(3).timeout
			stamina_bar.visible = false



func _on_dash_timer_timeout():
	dash_cooldown = true
	particles.emitting = false
	SPEED = SPEED / 3
	
func update_satmina_bar():
	stamina_bar.value = GLobal_script.stamina
	
	
func update_stamina():
	if GLobal_script.stamina < 100:
		GLobal_script.stamina = min(GLobal_script.stamina + 0.5, 100)  # Membatasi agar stamina tidak lebih dari 100
		# Tambahkan stamina dengan batas maksimum 100
		await get_tree().create_timer(3).timeout

		
