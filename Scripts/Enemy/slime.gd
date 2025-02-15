extends CharacterBody2D


var chase_player = false
const SPEED = 250
var player
var health = 100
var death = false
var target
@onready var animated_sprite_2d = $AnimatedSprite2D
var last_position
var waktu_respawn : int = 2
var drop_coin = preload("res://Sceens/Colectible/coin_anim.tscn")

func _ready():
	last_position = global_position

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if death == false:
		if chase_player:
			position += (player.position - position) / SPEED
			
			animated_sprite_2d.play('walk')
			
			if (player.position.x - position.x) < 0:
				animated_sprite_2d.flip_h = true
			else :
				animated_sprite_2d.flip_h = false
		else:
			animated_sprite_2d.play("iddle")

func _on_chase_area_body_entered(body):
	if body.is_in_group("Player"):
		player = body
		chase_player = true


func _on_chase_area_body_exited(body):
	if body.is_in_group("Player"):
		player = null
		chase_player = false

func attacked():
	health -= 20
	print(health)
	$AnimatedSprite2D.modulate = Color(1, 0.5, 0.5)  # Flash merah
	await get_tree().create_timer(0.1).timeout  # Tunggu 0.1 detik
	$AnimatedSprite2D.modulate = Color(1, 1, 1)  # Kembali normal
	
	if health <= 0:
		death = true
		die()
		
func die():
	if death == true :
		$AnimatedSprite2D.play("mati")
		await  animated_sprite_2d.animation_finished
		$CollisionShape2D2.disabled = true
		drop_item()
		GLobal_script.gain_exp(15)
		hide()
		await get_tree().create_timer(waktu_respawn).timeout
		queue_free()
		
func respawn():
	global_position = last_position  # Kembalikan ke posisi awal
	health = 100  # Pulihkan health
	death = false  # Status hidup kembali
	$CollisionShape2D2.disabled = false  # Aktifkan kembali bentuk kolisi
	show()  # Tampilkan node utama
	$AnimatedSprite2D.play("iddle")  # Mulai animasi diam

func _on_attack_area_body_entered(body):
	if body.is_in_group("Player") and death == false:
		target = body
		$attack_timer.start()



func _on_attack_timer_timeout():
		target.attacked_player()




func _on_attack_area_body_exited(body):
	if body.is_in_group("Player"):
		target = null
		$attack_timer.stop()
		
func drop_item():
	var anim_drop = drop_coin.instantiate()
	anim_drop.global_position = global_position
	get_tree().get_root().add_child(anim_drop)
