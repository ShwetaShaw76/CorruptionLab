extends TextureProgressBar
@onready var health_bar: Area2D = $HealthBar
@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D




var maxHealth: int = 100
var health : int = maxHealth

func take_damage(amount=20):
	health -= amount
	health = clamp(health , 0 , maxHealth)
	health_bar.value = health
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
		get_tree().reload_current_scene()
		
func zero_health():
	
	health = 0
	value = health
	animated_sprite.play("0%")
