extends Area2D

#Ends the scene when picking up the cake
func _on_Area2D_body_entered(body):
	if body.name == "Horse":
		queue_free()
		get_tree().quit()
	pass # Replace with function body.
