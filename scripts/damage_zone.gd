extends Area2D


func _on_body_entered(body: Node2D) -> void:
	print("Damage Zone")
	if body.is_in_group("player"):
		if body.has_method("play_damage_animation"):
			body.play_damage_animation()
