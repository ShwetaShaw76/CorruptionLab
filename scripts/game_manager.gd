extends Node


var score = 0
@onready var score_label: Label = $ScoreLabel
@onready var pause_menu: Control = $"../CanvasLayer/Pause MEnu"



func add_point():
	score += 1
	score_label.text = "Congratulations!! \n You collected \n" + str(score) + " coins."

func _ready():
	pause_menu.visible = false

	
