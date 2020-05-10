extends Area2D

export var next_scene: PackedScene

#Ends the scene when picking up the cake
func _on_Area2D_body_entered(body):
	if body.name == "Horse":
		print("Cake is taken")
		queue_free()
	pass # Replace with function body.
