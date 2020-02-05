extends KinematicBody2D

class_name box
var motion = Vector2()
const UP = Vector2(0, -1)


const GRAVITY = 10

func _physics_process(delta):
	motion.y += 10

	motion = move_and_slide(motion, UP)
	pass
func push(velocity: Vector2) -> void:
	print("Push not implemented in %s" % filename)