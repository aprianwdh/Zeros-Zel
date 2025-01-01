extends CharacterBody2D

@onready var ray_cast = $RayCast2D
@onready var player = $"../TileMap/Player"
@onready var progress_bar = $ProgressBar
@onready var boss_jawir = $"."
signal Boss_Kalah

var health: = 100:
	set(value):
		health = value
		progress_bar.value = value

var direction = Vector2.RIGHT
var speed  = 15.0

func _ready():
	set_physics_process(false)

func _process(_delta):
	direction = (player.position - global_position).normalized()
	ray_cast.target_position = direction * 100
	if health <= 0:
		die()

func _physics_process(delta):
	velocity = direction * speed
	move_and_slide()

#func _input(event):
	#if event.is_action_pressed("ui_up"):
		#health -= 1

func attacked():
	health -= 5
	boss_jawir.modulate = Color(1, 0.5, 0.5)  # Flash merah
	await get_tree().create_timer(0.1).timeout  # Tunggu 0.1 detik
	boss_jawir.modulate = Color(1, 1, 1)  # Kembali normal

func die():
	# Hentikan proses fisika dan logika lainnya
	set_physics_process(false)
	set_process(false)

	# Buat tween untuk fade out
	var tween = create_tween()
	tween.tween_property(boss_jawir, "modulate", Color(1, 1, 1, 0), 1.0)  # Fade ke transparan selama 1 detik

	# Hapus node setelah tween selesai
	tween.finished.connect(_on_tween_finished)

func _on_tween_finished():
	queue_free() 
	#await get_tree().create_timer(1).timeout
	emit_signal("Boss_Kalah")
	 # Hapus node setelah fade selesai
