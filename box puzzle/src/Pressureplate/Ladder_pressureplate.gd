extends Area2D

onready var Plate = get_node("Pressureplate_passive")
onready var pressurePlateSound = get_node("AudioStreamPlayer")

onready var child = get_child(5)

var pressureplate_child = true

func _ready():
	pass # Replace with function body.

func _on_Area2D_body_entered(body):
	if body is KinematicBody2D:
		pressurePlateSound.play()
		Plate.hide()
		child.show_Ladder()
		print("hei")
	pass # Replace with function body.


func _on_Area2D_body_exited(body):
	if body is KinematicBody2D && pressureplate_child == true:
		pressurePlateSound.play()
		Plate.show()
		child.hide_Ladder()
	pass # Replace with function body
	
func update_pressureplate_child(value: bool) -> void:
		pressureplate_child = value
