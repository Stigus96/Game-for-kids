extends box
class_name PhysicsBox

#makes the box pushable
func push(velocity: Vector2) -> void:
		move_and_slide(velocity, Vector2())

#function for reseting the box in certain scenes
func reset_box() -> void:
	position.x = 270
	position.y = -1344



