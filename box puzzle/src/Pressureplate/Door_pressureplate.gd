extends Area2D

onready var Plate = get_node("Pressureplate_passive")
onready var pressurePlateSound = get_node("AudioStreamPlayer")

onready var child = get_child(5)

#When KinematicBody2D enters, it plays sound, changes the pressureplate look, and updates the door 
func _on_Area2D_body_entered(body):
	if body is KinematicBody2D:
		pressurePlateSound.play() #Sound
		Plate.hide() #Changes the pressureplate look
		child.find_door(true)
		PlayerData.set_door(false) #Sets the door value to false (Not showing in the level)


func _on_Area2D_body_exited(body):
	if body is KinematicBody2D:
		pressurePlateSound.play() #Sound
		Plate.show() #Changes the pressureplate look
		PlayerData.set_door(true) #Sets the door value to false (Not showing in the level)
		child.find_door(false) 
	pass # Replace with function body

#Pressed presureplate look
func hide_pressurePlate():
	Plate.hide()
	
#Unpressed pressureplate look
func show_pressureplate():
	Plate.show()
