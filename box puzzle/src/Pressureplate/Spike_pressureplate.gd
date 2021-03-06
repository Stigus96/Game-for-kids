extends Area2D

onready var Plate = get_node("Pressureplate_passive")
onready var pressurePlateSound = get_node("AudioStreamPlayer")
onready var child = get_child(5)

func _ready():
	pass # Replace with function body.

#When a KinematicBody2D enters, sound is played, pressureplate is changed and the spikes are hidden
func _on_Area2D_body_entered(body):
	if body is KinematicBody2D:
		pressurePlateSound.play()
		Plate.hide()
		child.remove_spikes()
	pass # Replace with function body.

#When a KinematicBody2D enters, sound is played, pressureplate is changed and the spikes are shown
func _on_Area2D_body_exited(body):
	if body is KinematicBody2D:
		pressurePlateSound.play()
		Plate.show()
		child.show_spikes()
	pass # Replace with function body
