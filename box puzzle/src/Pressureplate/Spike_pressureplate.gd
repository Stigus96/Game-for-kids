extends Area2D

onready var Plate = get_node("Pressureplate_passive")

onready var child = get_child(4)

func _ready():
	pass # Replace with function body.

func _on_Area2D_body_entered(body):
	if body is KinematicBody2D:
		Plate.hide()
		child.remove_spikes()
	pass # Replace with function body.


func _on_Area2D_body_exited(body):
	if body is KinematicBody2D:
		Plate.show()
		child.show_spikes()
	pass # Replace with function body