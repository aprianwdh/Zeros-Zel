extends State
class_name ShootState

@export var bullet_node = preload("res://Sceens/world/bullet.tscn")
@onready var timer = $Timer


func transition():
	if not ray_cast.is_colliding():
		var new_state = "Follow" if owner.health >= 50 else "Dash"
		get_parent().change_state(new_state)

func enter():
	super.enter()
# Ganti sesuai struktur node Anda
	timer.start()

func exit():
	super.exit()
	timer.stop()

func _on_timer_timeout():
	shoot()

func shoot():
	if player is CharacterBody2D:
		var bullet = bullet_node.instantiate()
		bullet.position = global_position
		bullet.direction = (player.global_position - global_position).normalized()
		get_tree().current_scene.call_deferred("add_child", bullet)
	else:
		print("Player is not a Node2D!")

