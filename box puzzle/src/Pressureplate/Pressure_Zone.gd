extends Area2D


func _ready():
	pass # Replace with function body.






func _on_Area2D_body_entered(body):
	if body.name == "Player" || body.name == "Box":
		get_parent().queue_free()
	pass # Replace with function body.


func _on_Area2D_body_exited(body):
	pass # Replace with function body.
