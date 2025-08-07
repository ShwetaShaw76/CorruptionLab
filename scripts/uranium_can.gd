extends Area2D
@onready var health_bar: TextureProgressBar = $"../../player/HealthBar"

@onready var corruption_guage: Control = $"../../UI/UI container/corruption guage"




func _on_body_entered(body):
	if health_bar.has_method("fill_health"):
		health_bar.fill_health()
	
	if corruption_guage.has_method("increase_corruption"):
		corruption_guage.increase_corruption()
	queue_free()
