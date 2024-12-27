extends Area2D

var health = 50
var kayu = preload('res://Sceens/Colectible/kayu.tscn')

func _ready():
	$AnimatedSprite2D.play("attacked")


func die():
	var kayu_instance = kayu.instantiate()
	kayu_instance.global_position = global_position
	get_tree().get_root().add_child(kayu_instance)
	
func Attacked():
	health -= 10
	$AnimatedSprite2D.play("attacked")
	



func _on_area_entered(area):
	if area.is_in_group("area_player") and GLobal_script.current_weapon == 'axe':
		Attacked()
		
		if health <= 0:
			GLobal_script.gain_exp(5)
			$AnimatedSprite2D.play("dead")
			await $AnimatedSprite2D.animation_finished
			$StaticBody2D/CollisionShape2D.disabled = true
			$CollisionShape2D.disabled = true
			$StaticBody2D/CollisionShape2D2.disabled = false
			die()

