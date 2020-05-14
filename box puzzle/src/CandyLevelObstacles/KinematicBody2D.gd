extends KinematicBody2D

var motion = Vector2()
var state = 0
onready var hay = false
var speed = -350


func _ready():
	_physics_process(false)

# Called when the node enters the scene tree for the first time.
# Makes the camera on the scene to move at a constant speed throughout the level.
func _physics_process(delta):
		motion.x = speed
		move_and_slide(motion, Vector2(0,-1))
	

