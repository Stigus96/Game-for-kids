extends Area2D

export var candyLevel: PackedScene

#If the horse enters the body, the level changes to candyland
func _on_Area2D_body_entered(body):
	if body.name == "Horse":
		get_tree().change_scene_to(candyLevel)
	pass # Replace with function body.
