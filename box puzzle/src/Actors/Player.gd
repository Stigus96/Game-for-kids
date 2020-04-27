extends Actor

export var push_speed : = 140.0
export var upSpeed = 200

onready var AnimatedPlayer = get_node("AnimatedPlayer")
onready var right_ray = get_node("right_ray")
onready var left_ray = get_node("left_ray")
onready var i = 0

var fricitonValue = 0.5
var ladder_on = false
var is_jumping = false

func _ready():
	PlayerData.connect("ladder_updated", self, "update_ladder_on")
	pass


func _physics_process(delta: float) -> void:
	var motion : = Vector2()
	animate_player()
	crouch()
	if is_jumping && _velocity.y >= 0: # Checks if the player is jumping
		is_jumping = false
	
	motion.x = Input.get_action_strength("move_right") - Input.get_action_strength("move_left")
	
	var snap = Vector2.DOWN * 32 if !is_jumping else _velocity #Makes the var snap if the var is_jumping is false
	var is_jump_interrupted: = Input.is_action_just_released("jump") and _velocity.y < 0.0
	var direction = get_direction()
	_velocity = calculate_move_velocity(_velocity, direction, speed, is_jump_interrupted)
	_velocity = move_and_slide_with_snap(_velocity, snap, FLOOR_NORMAL, true) #Uses the snap var to snap to objects
	
	CheckLadderAndTakeAction()
	
	if left_ray.is_colliding() or right_ray.is_colliding(): #If the rays of the player collides with something
		if abs(motion.x) > 1:
			return
		if get_slide_count() > 0:#Makes sure the player is hitting a box
			var box: = get_slide_collision(0).collider as box
			if box:
				box.push(push_speed * motion) #Sets the box's push speed
	
	if Input.is_action_just_pressed("ui_focus_next"):
		get_tree().reload_current_scene()
		PlayerData.reset_player_speed() #restes the speed of the horse in candyland when the scene is reloaded.
	
#calculates which x direction the character is moving based on player input. also checks if the player is jumping
func get_direction () -> Vector2:
		return Vector2(Input.get_action_strength("move_right") - Input.get_action_strength("move_left"),
		-1.0 if Input.is_action_just_pressed("jump") and is_on_floor()  else 1.0)
		

#constantly checks if the player is touching a ladder, if true it will stop all movement and let the player climb up or down
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
		
#calculates velocity of the player by using speed and direction as inputs returns a vector that has the players current x and y velocity
func calculate_move_velocity(
	linear_velocity: Vector2,
	direction: Vector2,
	speed: Vector2,
	is_jump_interrupted: bool) -> Vector2:
	var out: = linear_velocity
	out.x = speed.x * direction.x
	out.y += gravity * get_physics_process_delta_time()
	if direction.y == -1.0:
		out.y = speed.y * direction.y
	if is_jump_interrupted:
		out.y = 0.0
	if Input.is_action_just_pressed("jump") and is_on_floor():
		is_jumping = true 
		$jumpSound.play()
	return out

func check_box_collision(motion : Vector2) -> void:
	if abs(motion.x) > 1:
		return
	var box : = get_slide_collision(0).collider as box
	if box:
		box.push(push_speed * motion) #Sets the box's push speed
		
#changes the players animation based on what action it's currently doing
func animate_player():
	var is_crouching = Input.is_action_pressed("crouch")
	var start_crouching = Input.is_action_just_pressed("crouch")
	var direction = get_direction()
	if (ladder_on == false):
		if (direction.x < 0 && is_crouching == false):
			AnimatedPlayer.play("walk_left")
		if (direction.x > 0 && is_crouching == false):
			 AnimatedPlayer.play("walk_right")
		if(direction.x == 0 && is_crouching == false):
			AnimatedPlayer.play("idle")
		if (direction.x < 0 && is_crouching == true):
			AnimatedPlayer.play("crouch_walk_left")
		if (direction.x > 0 && is_crouching == true):
			 AnimatedPlayer.play("crouch_walk_right")
		if(direction.x == 0 && start_crouching == true):
			AnimatedPlayer.play("start_crouching")
		if(direction.x == 0 && is_crouching == true && AnimatedPlayer.is_playing() == false):
			AnimatedPlayer.play("is_crouching")
	if (ladder_on == true):
		AnimatedPlayer.play("climb")

#changes hitbox when the player is crouching
func crouch():
	var is_crouching = Input.is_action_pressed("crouch")
	if (is_crouching):
		get_node("body").disabled=true
		get_node("hat").disabled=true
		get_node("crouch hat").disabled=false
		get_node("crouch body").disabled=false
		speed.x = 150
	else:
		get_node("body").disabled=false
		get_node("hat").disabled=false
		get_node("crouch hat").disabled=true
		get_node("crouch body").disabled=true
		speed.x = 300

func update_ladder_on() -> void:
	ladder_on = PlayerData.get_ladder()
	
func update_playerAutoMov(value: bool):
	var ev = InputEventAction.new()
# set as move_left, pressed
	ev.action = "move_right"
	ev.pressed = value
# feedback
	Input.parse_input_event(ev)
