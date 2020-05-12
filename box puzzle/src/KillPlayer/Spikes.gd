extends Area2D

#If a object named horse or player enters the hitbox, restart the scene.
func _on_Spikes_body_entered(body):
	if body.name == "Player" or body.name == "Horse":
		PlayerData.set_checkpointScore(1)
		get_tree().reload_current_scene()
		PlayerData.reset_player_speed()
	pass # Replace with function body.
