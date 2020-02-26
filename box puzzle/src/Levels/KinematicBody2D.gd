extends KinematicBody2D

var motion = Vector2()
var state = 0


# Called when the node enters the scene tree for the first time.
func _physics_process(delta):
	state = floor(rand_range(0,2))

	if state == 0:
		pass
	elif state ==1:
		motion.x = 200
	elif state == 2:
		motion.x == -200
	move_and_slide(motion, Vector2(0,-1))
