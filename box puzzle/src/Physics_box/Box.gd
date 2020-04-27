extends KinematicBody2D

class_name box

var motion = Vector2()

const UP = Vector2(0, -1)
const GRAVITY = 10

#Decides the physics of the box
func _physics_process(delta):
	motion.y += 10
	motion = move_and_slide(motion, UP)
	pass



