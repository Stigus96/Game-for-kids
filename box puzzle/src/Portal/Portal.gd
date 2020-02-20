extends Area2D

export var next_scene: PackedScene


func _on_Portal_body_entered(body):
	teleport()
	pass # Replace with function body.
	
func teleport() -> void:
	get_tree().change_scene_to(next_scene)
