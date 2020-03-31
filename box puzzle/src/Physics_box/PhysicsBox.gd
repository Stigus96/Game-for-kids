extends box
class_name PhysicsBox

func push(velocity: Vector2) -> void:
		move_and_slide(velocity, Vector2())
		
		
func reset_box() -> void:
	position.x = 270
	position.y = -1344



