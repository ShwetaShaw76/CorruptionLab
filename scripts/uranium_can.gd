extends Area2D





func _on_body_entered(body):
	print("Corruption level increased")
	queue_free()
