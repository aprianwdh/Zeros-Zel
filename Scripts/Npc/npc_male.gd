extends CharacterBody2D

@export var speed: float = 1500
var direction: Vector2 = Vector2.ZERO
var movement_timer: Timer
var animated_sprite: AnimatedSprite2D 
@onready var ray_cast_right = $AnimatedSprite2D/RayCast_Right
@onready var ray_cast_down = $AnimatedSprite2D/RayCast_Down
@onready var ray_cast_up = $AnimatedSprite2D/RayCast_Up
@onready var ray_cast_left = $AnimatedSprite2D/RayCast_left

func _ready():
	# Referensi ke AnimatedSprite2D
	animated_sprite = $AnimatedSprite2D

	# Inisialisasi timer untuk perubahan arah
	movement_timer = Timer.new()
	movement_timer.wait_time = 2.0
	movement_timer.one_shot = false
	movement_timer.connect("timeout", Callable(self, "_change_direction"))
	add_child(movement_timer)
	movement_timer.start()
	_change_direction()

func _process(delta: float):
	velocity = direction * speed * delta
	move_and_slide()  # Sesuai dengan Node CharacterBody2D
	_update_animation()
	_check_collision()

func _change_direction():
	# Tentukan arah secara acak (kanan, atas, atau bawah)
	var possible_directions = [
		Vector2.RIGHT,
		Vector2.UP,
		Vector2.DOWN,
		Vector2.LEFT
	]
	direction = possible_directions[randi() % possible_directions.size()]

func _update_animation():
	if direction == Vector2.RIGHT:
		animated_sprite.play("move_side")
		animated_sprite.flip_h = false  # Tidak dibalik
	elif direction == Vector2.LEFT:
		animated_sprite.play("move_side")  # Gunakan animasi "right"
		animated_sprite.flip_h = true  # Dibalik ke kiri
	elif direction == Vector2.UP:
		animated_sprite.play("move_up")
		animated_sprite.flip_h = false  # Pastikan tidak terbalik
	elif direction == Vector2.DOWN:
		animated_sprite.play("move_down")
		animated_sprite.flip_h = false  # Pastikan tidak terbalik
		
func _check_collision():
	# Cek jika RayCast2D mendeteksi tabrakan
	if ray_cast_right.is_colliding() and direction == Vector2.RIGHT:
		_change_direction()
	elif ray_cast_up.is_colliding() and direction == Vector2.UP:
		_change_direction()
	elif ray_cast_down.is_colliding() and direction == Vector2.DOWN:
		_change_direction()
	elif ray_cast_left.is_colliding() and direction == Vector2.LEFT:
		_change_direction()



