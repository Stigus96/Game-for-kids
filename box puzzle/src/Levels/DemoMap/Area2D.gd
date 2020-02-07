extends Area2D
func _ready():
	pass # Replace with function body.


<<<<<<< HEAD:box puzzle/src/Levels/DemoMap/Area2D.gd


func _on_Area2D_body_entered(body):
	if body.name == "Player":
		print("entered")
		get_tree().paused = true
		pass # Replace with function body.


func _on_Area2D_body_exited(body):
	if body.name == "Player":
		print("entered")
		get_tree().paused = false
		pass # Replace with function body.
	pass # Replace with function body.
=======
func _on_Area2D_body_entered(body):
	if body.name == "Player" || body.name == "PhysicsBox":
		get_parent().queue_free()
	pass # Replace with function body.

>>>>>>> Collectable_Items-#19:box puzzle/src/Pressureplate/Pressure_Zone.gd
