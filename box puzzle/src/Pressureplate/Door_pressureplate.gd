extends Area2D

onready var Plate = get_node("Pressureplate_passive")
onready var pressurePlateSound = get_node("AudioStreamPlayer")

onready var child = get_child(5)


func _ready():
	pass # Replace with function body.

func _on_Area2D_body_entered(body):
	if body is KinematicBody2D:
		pressurePlateSound.play()
		Plate.hide()
		child.find_door(true)
		PlayerData.set_door(false)
		
	pass # Replace with function body.


func _on_Area2D_body_exited(body):
	if body is KinematicBody2D:
		pressurePlateSound.play()
		Plate.show()
		PlayerData.set_door(true)
		child.find_door(false)
	pass # Replace with function body

func hide_pressurePlate():
	Plate.hide()
	
func show_pressureplate():
	Plate.show()
