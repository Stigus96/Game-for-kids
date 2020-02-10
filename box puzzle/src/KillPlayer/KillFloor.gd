extends Area2D

func _on_KillFloor_body_entered(body):
	if body.name == "Player":
		get_tree().reload_current_scene()

