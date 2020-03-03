extends KinematicBody2D

var motion = Vector2()
var state = 0


# Called when the node enters the scene tree for the first time.
func _physics_process(delta):
	motion.x = 300
	move_and_slide(motion, Vector2(0,-1))
