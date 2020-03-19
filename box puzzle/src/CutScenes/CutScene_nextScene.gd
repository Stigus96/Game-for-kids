extends Area2D


func _on_Area2D_body_entered(body):
	if body.name == "Horse":
		get_tree().change_scene("res://src/Levels/Candyland.tscn")
	pass # Replace with function body.
