extends Area2D

onready var Plate = get_node("Pressureplate_passive")

onready var childer = self.get_child(3)

func _ready():
	pass # Replace with function body.

func _on_Area2D_body_entered(body):
	if body is KinematicBody2D:
		childer.find_door(true)
		Plate.hide()
		PlayerData.set_door(false)
	pass # Replace with function body.


func _on_Area2D_body_exited(body):
	if body is KinematicBody2D:
		print(childer.get_door_value())
		Plate.show()
		PlayerData.set_door(true)
		childer.find_door(false)
	pass # Replace with function body
