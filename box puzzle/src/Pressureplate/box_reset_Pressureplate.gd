extends Area2D

onready var Plate = get_node("Pressureplate_passive")
onready var pressurePlateSound = get_node("AudioStreamPlayer")
onready var child = get_child(5)

func _ready():
	pass # Replace with function body.

#Resets the box
func _on_Area2D_body_entered(body):
	if body is KinematicBody2D:
		pressurePlateSound.play()
		Plate.hide()
		child.reset_box()
	pass # Replace with function body.

#Changes the pressureplate sprite
func _on_Area2D_body_exited(body):
	if body is KinematicBody2D:
		pressurePlateSound.play()
		Plate.show()
	pass # Replace with function body
