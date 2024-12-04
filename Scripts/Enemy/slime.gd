extends CharacterBody2D


var chase_player = false
const SPEED = 100
var player
@onready var animated_sprite_2d = $AnimatedSprite2D

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
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
