extends Area2D

export var candyLevel: PackedScene

func _on_Area2D_body_entered(body):
	if body.name == "Horse":
		get_tree().change_scene_to(candyLevel)
	pass # Replace with function body.
