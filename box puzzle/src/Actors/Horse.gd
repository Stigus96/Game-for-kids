extends "res://src/Actors/Actor.gd"

# Declare member variables here. Examples:
export var speed_adjust_right: = 150
export var speed_adjust_left: = 250
onready var AnimatedHorse = get_node("AnimatedHorse")
var timer
var speedCut = 1

func _ready():
	#make a timer that is connected on a timeout
	timer = get_node("Timer")
	timer.connect("timeout",self,"_on_timer_timeout") 
	pass
	
func _physics_process(delta: float) -> void:
	animate_horse()
	var is_jump_interrupted: = Input.is_action_just_released("jump") and _velocity.y < 0.0
	var direction = get_direction()
	var current_speed = speed
	current_speed = calculate_x_speed(direction)
	_velocity = calculate_move_velocity(_velocity, direction, speed, is_jump_interrupted, current_speed)
	_velocity = move_and_slide(_velocity, FLOOR_NORMAL)
	
	if Input.is_action_just_pressed("ui_focus_next"):
		get_tree().reload_current_scene()
		print("backspace")
		PlayerData.reset_player_speed()#resets the player speed when the scene is reloaded
	
#calculates which x direction the horse is moving based on horse input. also checks if the horse is jumping
func get_direction () -> Vector2:
		return Vector2(
		Input.get_action_strength("move_right") - Input.get_action_strength("move_left"),
		-1.0 if Input.is_action_just_pressed("jump") and is_on_floor() else 1.0)
		
		
		

#calculates the speed of the horse using the speed_adjust variables
func calculate_x_speed(
direction: Vector2
):
	var current_speed = speed.x
	if speedCut == 0:
		current_speed = 0
	elif speedCut != 0:
		if direction.x > 0:
			current_speed = speed.x + speed_adjust_right
		if direction.x < 0:
			current_speed = speed.x - speed_adjust_left
	return current_speed
	
func _on_timer_timeout():
	print("Timer timeout")
	PlayerData.update_player_speed(false)


#controlls which animation the horse is doing
func animate_horse():
	if speedCut != 0:
		if (is_on_floor() == false):
			AnimatedHorse.play("jump")
		else:
			AnimatedHorse.play("run")

#calculates velocity of the horse by using speed and direction as inputs returns a vector that has the horses current x and y velocity
func calculate_move_velocity(
	linear_velocity: Vector2,
	direction: Vector2,
	speed: Vector2,
	is_jump_interrupted: bool,
	current_speed
) -> Vector2:
	var out: = linear_velocity
	out.x = current_speed * PlayerData.get_player_speed()
	out.y += gravity * get_physics_process_delta_time()
	if direction.y == -1.0:
		out.y = speed.y * direction.y
	if is_jump_interrupted:
		out.y = 0.0
	return out
