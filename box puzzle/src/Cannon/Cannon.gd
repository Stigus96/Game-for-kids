extends Node2D

var cannonBall = preload("res://src/Cannon/CannonBall.tscn")

var cannon_position = self.get_global_position()

onready var animatedSprite = get_node("AnimatedSprite")

var time = 0

var timer = null


func _ready():
	timer = Timer.new()
	timer.set_one_shot(true)
	timer.set_wait_time(get_random_time())
	add_child(timer)
	timer.start()
	print("Hei1")
	print(timer.get_time_left())
	timer.connect("timeout", self, "on_timeout_complete")

func get_random_time() -> int:
	time = randi()%3 + 2
	print(time)
	return time

func on_timeout_complete():
	Shoot_cannonBall()

func Shoot_cannonBall():
	print("hei2")
	var cannonBall_instance = cannonBall.instance()
	cannonBall_instance.position = self.get_global_position()
	get_parent().add_child(cannonBall_instance)
		
	animatedSprite.play("Shoot")
		
	timer.set_wait_time(get_random_time())
	timer.start()
		


func _on_AnimatedSprite_animation_finished():
	animatedSprite.stop()
	pass # Replace with function body.
