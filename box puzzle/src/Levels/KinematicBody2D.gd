
extends KinematicBody2D

onready var parent = get_parent()

onready var cutscene = parent.get_node("CutScene_Wizzard")
var motion = Vector2()
var state = 0


# Called when the node enters the scene tree for the first time.
func _physics_process(delta):
	if cutscene.get_state() == true:
		motion.x = 250
	
	move_and_slide(motion, Vector2(0,-1))
