extends Actor

export var push_speed : = 140.0
onready var AnimatedPlayer = get_node("AnimatedPlayer")
onready var right_ray = get_node("right_ray")
onready var left_ray = get_node("left_ray")
var ladder_on = false
export var upSpeed = 200
export var CutScene_speed = 0

onready var i = 0


func _ready():
	PlayerData.connect("ladder_updated", self, "update_ladder_on")
	pass


func _physics_process(delta: float) -> void:
	var motion : = Vector2()
	animate_player()
	motion.x = CutScene_speed
	
	var is_jump_interrupted: = Input.is_action_just_released("jump") and _velocity.y < 0.0
	var direction = get_direction()
	_velocity = calculate_move_velocity(_velocity, direction, speed, is_jump_interrupted)
	_velocity = move_and_slide(_velocity, FLOOR_NORMAL) 
	CheckLadderAndTakeAction()
	
	if left_ray.is_colliding() or right_ray.is_colliding():
		if abs(motion.x) > 1:
			return
		if get_slide_count() > 0:
			var box: = get_slide_collision(0).collider as box
			if box:
				box.push(push_speed * motion)
	
	if Input.is_action_just_pressed("ui_focus_next"):
		get_tree().reload_current_scene()
	
	
func get_direction () -> Vector2:
		return Vector2(
		CutScene_speed,0)
		
func CheckLadderAndTakeAction():
	if ladder_on == true:
		gravity = 0
		_velocity.y = 0
		_velocity.x = 0
		if Input.get_action_strength("climb_up"):
			_velocity.y -= upSpeed
		elif Input.get_action_strength("climb_down"):
			_velocity.y += upSpeed
	else:
		 gravity = 830
		
		
		
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
		
func animate_player():
	var is_crouching = Input.is_action_pressed("crouch")
	var direction = get_direction()
	if (direction.x < 0):
		AnimatedPlayer.play("walk_left")
	if (direction.x > 0 && is_crouching == false):
		 AnimatedPlayer.play("walk_right")
	if(direction.x == 0 && is_crouching == false):
		AnimatedPlayer.play("idle")

func update_ladder_on() -> void:
	ladder_on = PlayerData.get_ladder()
