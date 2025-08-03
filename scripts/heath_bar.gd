extends TextureProgressBar
@onready var health_bar: Area2D = $HealthBar
@onready var animated_sprite: AnimatedSprite2D = $Health_Bar/AnimatedSprite2D2
@onready var timer: Timer = $Timer





var maxHealth: int = 100
var health : int = maxHealth

func take_damage(amount=20):
	health -= amount
	health = clamp(health , 0 , maxHealth)
	value = health
	if health <= 80:
		animated_sprite.play("80%")
	elif health == 60:
		animated_sprite.play("60%")
	elif health == 40:
		animated_sprite.play("40%")
	elif health == 20:
		animated_sprite.play("20%")
	elif health == 0:
		animated_sprite.play("0%")
		timer.start()
		

		
func zero_health():
	
	health = 0
	value = health
	animated_sprite.play("dying")


func _on_timer_timeout() -> void:
	get_tree().reload_current_scene()
