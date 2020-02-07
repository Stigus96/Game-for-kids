extends Area2D
func _ready():
	pass # Replace with function body.




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
