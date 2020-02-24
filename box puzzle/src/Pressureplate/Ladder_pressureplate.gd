extends Area2D

onready var child = get_child(4)

func _ready():
	pass # Replace with function body.

func _on_Area2D_body_entered(body):
	if body is KinematicBody2D:
		child.show_Ladder()
		print("hei")
	pass # Replace with function body.


func _on_Area2D_body_exited(body):
	if body is KinematicBody2D:
		child.hide_Ladder()
	pass # Replace with function body
