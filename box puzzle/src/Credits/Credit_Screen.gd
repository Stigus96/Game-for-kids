extends KinematicBody2D

onready var numberOfTimeouts = 0

onready var credit_Speed = 0

export var speed: = Vector2(0.0, 0.0)

onready var _velocity: = Vector2.ZERO

onready var plass = self.get_position()

#Moves the credits upwards
func _physics_process(delta: float) -> void:
	speed.y = credit_Speed
	_velocity = move_and_slide(speed)
	pass

func _on_Timer_timeout():
	#When 2 seconds has gone by, the credits start to move
	if numberOfTimeouts == 2:
		_velocity.y = 1000
		credit_Speed = -30
	#After 49 seconds the game is done and closes
	elif numberOfTimeouts == 49:
		get_tree().quit()
	numberOfTimeouts += 1
	pass # Replace with function body.
