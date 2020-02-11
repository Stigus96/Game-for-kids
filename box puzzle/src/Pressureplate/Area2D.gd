extends Area2D

onready var Plate = get_node("Pressureplate_passive")

func _ready():
	pass # Replace with function body.

func _on_Area2D_body_entered(body):
	if body.name == "Player" || body.name == "PhysicsBox2":
		Plate.hide()
		PlayerData.set_door(false)
	pass # Replace with function body.


func _on_Area2D_body_exited(body):
	if body.name == "Player" || body.name == "PhysicsBox2":
		Plate.show()
		PlayerData.set_door(true)
	pass # Replace with function body.
