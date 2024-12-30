extends Area2D

signal terkena_bullet
var direction = Vector2.RIGHT
var SPEED = 200
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position += direction*SPEED*delta
	
	


func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()


func _on_hit_area_body_entered(body):
	if body.is_in_group("Player"):
		body.attacked_player()