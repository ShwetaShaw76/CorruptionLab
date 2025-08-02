extends TextureProgressBar
@onready var health_bar: Area2D = $HealthBar



var maxHealth: int = 100
var health : int = maxHealth

func take_damage(amount: int):
	health -= amount
	health = clamp(health , 0 , maxHealth)
	health_bar.value = health
