extends Area2D




func _on_Area2D_body_entered(body):
	if body.name == "Horse":
		queue_free()
		get_tree().quit()
	pass # Replace with function body.
