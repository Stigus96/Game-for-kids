extends Area2D

func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Spikes_body_entered(body):
	if body.name == "Player" or body.name == "Horse":
		get_tree().reload_current_scene()
		PlayerData.reset_player_speed()
	pass # Replace with function body.
