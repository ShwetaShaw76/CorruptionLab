extends Control

signal corruption_changed(new_corruption: int)

@onready var background: TextureRect = $Background
@onready var corruption_guage: Control = $"."
@onready var pause_menu: Control = get_tree().current_scene.get_node("CanvasLayer/Pause MEnu")

var corruption = 0
var max_corruption = 6 

@onready var uranium_corruption_texture_0: Texture2D = preload("res://assets/sprites/corruption_meter_0.png")
@onready var uranium_corruption_texture_1: Texture2D = preload("res://assets/sprites/corruption_meter_1.png")
@onready var uranium_corruption_texture_2: Texture2D = preload("res://assets/sprites/corruption_meter_2.png")
@onready var uranium_corruption_texture_3: Texture2D = preload("res://assets/sprites/corruption_meter_3.png")
@onready var uranium_corruption_texture_4: Texture2D = preload("res://assets/sprites/corruption_meter_4.png")
@onready var uranium_corruption_texture_5: Texture2D = preload("res://assets/sprites/corruption_meter_5.png")
@onready var uranium_corruption_texture_full: Texture2D = preload("res://assets/sprites/corruption-meter.png")

func increase_corruption():
	corruption = clamp(corruption + 1, 0, max_corruption)

	match corruption:
		0:
			background.texture = uranium_corruption_texture_0
		1:
			background.texture = uranium_corruption_texture_1
		2:
			background.texture = uranium_corruption_texture_2
		3:
			background.texture = uranium_corruption_texture_3
		4:
			background.texture = uranium_corruption_texture_4
		5:
			background.texture = uranium_corruption_texture_5
		6:
			background.texture = uranium_corruption_texture_full
			
	emit_signal("corruption_changed",corruption)

func decrease_corruption():
	corruption = clamp(corruption - 1, 0, max_corruption)

	match corruption:
		0:
			background.texture = uranium_corruption_texture_0
		1:
			background.texture = uranium_corruption_texture_1
		2:
			background.texture = uranium_corruption_texture_2
		3:
			background.texture = uranium_corruption_texture_3
		4:
			background.texture = uranium_corruption_texture_4
		5:
			background.texture = uranium_corruption_texture_5
		6:
			background.texture = uranium_corruption_texture_full
			
	emit_signal("corruption_changed",corruption)


func _on_button_pressed() -> void:
	if get_tree().paused:
		pause_menu.resume() 
	elif get_tree().paused == false:
		pause_menu.pause() 
