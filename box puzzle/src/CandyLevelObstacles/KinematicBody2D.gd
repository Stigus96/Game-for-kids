extends KinematicBody2D

var motion = Vector2()
var state = 0
onready var hay = false


func _ready():
	_physics_process(false)

# Called when the node enters the scene tree for the first time.
func _physics_process(delta):
	if hay == false:
		motion.x = 0
		move_and_slide(motion, Vector2(0,-1))
	elif hay == true:
		motion.x = 250
		move_and_slide(motion, Vector2(0,-1))

func moveScene() -> void:
	motion.x = 250
	move_and_slide(motion, Vector2(0,-1))
	print(motion)
