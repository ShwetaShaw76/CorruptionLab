extends Area2D
@onready var collision_shape_2d: CollisionShape2D = $CollisionShape2D
@onready var corruption_guage: Control = get_tree().current_scene.get_node("UI/UI container/corruption guage")


var can_damage := true


func _on_body_entered(body):
	if can_damage:
		if body.is_in_group("player"):
			if body.has_method("play_damage_animation"):
				body.play_damage_animation()
			can_damage = false
	corruption_guage.decrease_corruption()
			


func _on_body_exited(body: Node2D):
	if body.is_in_group("player"):
		can_damage = true
