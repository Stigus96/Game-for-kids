extends Node2D

var cannonBall = preload("res://src/Cannon/CannonBall_Left.tscn")

var cannon_position = self.get_global_position()

onready var animatedSprite = get_node("AnimatedSprite")

export var RandomShoot = true
export var TimeDelay = 3

var time = 0
var timer = null

onready var CannonSound = get_node("AudioStreamPlayer")

#Makes a new timer when it get initialized
func _ready():
	timer = Timer.new()
	timer.set_one_shot(true)
	#If it set to shood random, it make the timeout time random
	if RandomShoot == true:
		timer.set_wait_time(get_random_time())
	elif RandomShoot == false:
		timer.set_wait_time(TimeDelay)
	add_child(timer)
	timer.start()
	timer.connect("timeout", self, "on_timeout_complete")

#Makes a random timeout time
func get_random_time() -> int:
	time = randi()%3 + 2
	print(time)
	return time

#Makes a random timeout time
func on_timeout_complete():
	Shoot_cannonBall()
	CannonSound.play()

#Shoots the cannonball
func Shoot_cannonBall():
	#Makes a new cannonball in the level
	var cannonBall_instance = cannonBall.instance()
	cannonBall_instance.position = self.get_global_position()
	get_parent().add_child(cannonBall_instance)
	
	#Plays shoot animation
	animatedSprite.play("Shoot")
	
	#Sets next timeout time
	if RandomShoot == true:
		timer.set_wait_time(get_random_time())
	elif RandomShoot == false:
		timer.set_wait_time(TimeDelay)
		
	timer.start()
		


#Stops the animation when its finished
func _on_AnimatedSprite_animation_finished():
	animatedSprite.stop()
	pass # Replace with function body.
