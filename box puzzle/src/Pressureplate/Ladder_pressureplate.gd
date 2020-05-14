extends Area2D

onready var Plate = get_node("Pressureplate_passive")
onready var pressurePlateSound = get_node("AudioStreamPlayer")

onready var child = get_child(5)

var pressureplate_child = true

#When a KinematicBody2D enters, sound is played, pressureplate is changed and the ladder is shown
func _on_Area2D_body_entered(body):
	if body is KinematicBody2D:
		pressurePlateSound.play()
		Plate.hide()
		child.show_Ladder()
	pass # Replace with function body.


#When a KinematicBody2D enters, sound is played, pressureplate is changed and the ladder is hidden
func _on_Area2D_body_exited(body):
	if body is KinematicBody2D && pressureplate_child == true:
		pressurePlateSound.play()
		Plate.show()
		child.hide_Ladder()
	pass # Replace with function body
	
#Sets the pressureplate's child value
func update_pressureplate_child(value: bool) -> void:
		pressureplate_child = value
