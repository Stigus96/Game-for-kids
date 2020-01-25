extends Actor

export var push_speed : = 125.0

func _physics_process(delta: float) -> void:
	var motion : = Vector2()
	
	motion.x = Input.get_action_strength("move_right") - Input.get_action_strength("move_left")
	
	var is_jump_interrupted: = Input.is_action_just_released("jump") and _velocity.y < 0.0
	var direction = get_direction()
	_velocity = calculate_move_velocity(_velocity, direction, speed, is_jump_interrupted)
	_velocity = move_and_slide(_velocity, FLOOR_NORMAL)
	
	if get_slide_count() > 0:
		check_box_collision(motion)
		
	
	
func get_direction () -> Vector2:
		return Vector2(
		Input.get_action_strength("move_right") - Input.get_action_strength("move_left"),
		-1.0 if Input.is_action_just_pressed("jump") and is_on_floor() else 1.0
	)
		
		
func calculate_move_velocity(
	linear_velocity: Vector2,
	direction: Vector2,
	speed: Vector2,
	is_jump_interrupted: bool
) -> Vector2:
	var out: = linear_velocity
	out.x = speed.x * direction.x
	out.y += gravity * get_physics_process_delta_time()
	if direction.y == -1.0:
		out.y = speed.y * direction.y
	if is_jump_interrupted:
		out.y = 0.0
	return out

func check_box_collision(motion : Vector2) -> void:
	if abs(motion.x) > 1:
		return
	var box : = get_slide_collision(0).collider as box
	if box:
		box.push(push_speed * motion)
