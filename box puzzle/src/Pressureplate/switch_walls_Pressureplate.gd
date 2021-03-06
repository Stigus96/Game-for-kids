extends Area2D

onready var Plate = get_node("Pressureplate_passive")
onready var pressurePlateSound = get_node("AudioStreamPlayer")

func _ready():
	PlayerData.connect("color_door_updated", self, "update_color_door")

#When KinematicBody2D enters, it plays sound, changes the pressureplate look, and updates the door 
func _on_Area2D_body_entered(body):
	if body is KinematicBody2D:
		
		if PlayerData.get_color_door() == false:
			pressurePlateSound.play()
			Plate.hide()
			PlayerData.set_color_door(true)
		
		elif PlayerData.get_color_door() == true:
			pressurePlateSound.play()
			Plate.hide()
			PlayerData.set_color_door(false)
		
	pass # Replace with function body.

#When KinematicBody2D enters, it plays sound, changes the pressureplate look, and updates the door 
func _on_Area2D_body_exited(body):
	if body is KinematicBody2D:
		pressurePlateSound.play()
		Plate.show()
	pass # Replace with function body

func hide_pressurePlate():
	Plate.hide()
	
func show_pressureplate():
	Plate.show()
