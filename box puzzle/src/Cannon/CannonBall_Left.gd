extends Area2D

var vel = Vector2()
export var cannonBall_speed = -6

var oldPos = Vector2()
var posX

var velocity = Vector2(cannonBall_speed,0)

onready var animatedSprite = get_node("AnimatedSprite")
	
func _physics_process(delta):
	oldPos = get_position()
	oldPos.x += cannonBall_speed
	set_position(oldPos)
	
	if oldPos.x > 10000:
		queue_free()
	
	if oldPos.x < -10000:
		queue_free()


func _on_CannonBall_body_entered(body):
	if body.name == "Player":
		get_tree().reload_current_scene()
		
	elif body is TileMap:
		print("Explode")
		cannonBall_speed = 0
		get_node("Sprite").hide()
		animatedSprite.play("Explode")


func _on_AnimatedSprite_animation_finished():
	animatedSprite.stop()
	queue_free()
	pass # Replace with function body.
