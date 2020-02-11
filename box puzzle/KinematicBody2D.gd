extends KinematicBody2D 

class_name Actor

export var speed: = Vector2(300.0, 100.0)
export var gravity: = 100.0

var velocity: = Vector2.ZERO

func _physics_process(delta: float) -> void:
	velocity.y += gravity * delta
	
	for i in get_slide_count():
    var collision = get_slide_collision(i)
    print("Collided with: ", collision.collider.name)