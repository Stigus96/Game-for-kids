extends Area2D


func _ready():
	pass # Replace with function body.

func _on_Pressureplate_reader_body_entered(body):
	if body.name == "Player" || body.name == "PhysicsBox2":
		print("hei")
		queue_free()
	pass # Replace with function body.
