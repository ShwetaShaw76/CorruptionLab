extends Area2D

const FILE_BEGIN = "res://levels/level_"

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		
		var current_scene_file = get_tree().current_scene.scene_file_path
		var current_scene_name = current_scene_file.get_file().get_basename() 

		var current_level_number = 0
		if current_scene_name == "game":
			current_level_number = 1 
		else:
			current_level_number = int(current_scene_name.split("_")[1])

		
		var next_level_number = current_level_number + 1
		var next_level_path = FILE_BEGIN + str(next_level_number) + ".tscn"

		if ResourceLoader.exists(next_level_path):
			get_tree().change_scene_to_file(next_level_path)
		else:
			print("No next level found:", next_level_path)
		
