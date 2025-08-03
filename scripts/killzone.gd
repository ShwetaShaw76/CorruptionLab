extends Area2D

@onready var timer: Timer = $Timer




func _on_body_entered(body):
	
	if body.is_in_group("player"):
		print("You died")
		Engine.time_scale = 0.5
		if body.has_method("play_death_animation"):
			body.play_death_animation()
			
			var health = get_tree().root.get_node("Game/player/HealthBar")
			if health.has_method("zero_health"):
				health.zero_health()
			
	
	timer.start()
	

	
	


func _on_timer_timeout():
	Engine.time_scale = 1.0
	get_tree().reload_current_scene()
