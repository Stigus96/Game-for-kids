extends Area2D

func _on_KillFloor_body_entered(body):
	if body.name == "Player":
		PlayerData.score = 0
		get_tree().reload_current_scene()

