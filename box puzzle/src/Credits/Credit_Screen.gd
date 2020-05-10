extends KinematicBody2D

onready var numberOfTimeouts = 0

onready var credit_Speed = 0

export var speed: = Vector2(0.0, 0.0)

onready var _velocity: = Vector2.ZERO

onready var plass = self.get_position()




func _physics_process(delta: float) -> void:
	speed.y = credit_Speed
	_velocity = move_and_slide(speed)
	print(credit_Speed)
	pass

func _on_Timer_timeout():
	if numberOfTimeouts == 2:
		_velocity.y = 1000
		credit_Speed = -30
	numberOfTimeouts += 1
	pass # Replace with function body.
