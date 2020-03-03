extends Area2D

func _on_KillFloor_body_entered(body):
	if body.name == "Horse":
		get_tree().reload_current_scene()
		PlayerData.reset_player_speed()
		
	

