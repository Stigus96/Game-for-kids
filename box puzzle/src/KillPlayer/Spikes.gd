extends Area2D

func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Spikes_body_entered(body):
	if body.name == "Player":
		get_tree().reload_current_scene()
	
	
	
	pass # Replace with function body.
