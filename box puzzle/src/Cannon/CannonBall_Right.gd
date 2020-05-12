extends Area2D

var vel = Vector2()
export var cannonBall_speed = 6

var oldPos = Vector2()
var posX

var velocity = Vector2(cannonBall_speed,0)

onready var animatedSprite = get_node("AnimatedSprite")
	
#Moves the cannonball
func _physics_process(delta):
	oldPos = get_position()
	oldPos.x += cannonBall_speed
	set_position(oldPos)
	
	#After 10000 units it delete itself
	if oldPos.x > 10000:
		queue_free()
	
	#After 10000 units it delete itself
	if oldPos.x < -10000:
		queue_free()

#If the cannonball hit the player, the level reloads
func _on_CannonBall_body_entered(body):
	if body.name == "Player":
		get_tree().reload_current_scene()
		
	#If it hits the tilemap, the explode animation plays
	elif body is TileMap:
		print("Explode")
		cannonBall_speed = 0
		get_node("Sprite").hide()
		animatedSprite.play("Explode")

#When the explosion animation is finnished, it is deleted 
func _on_AnimatedSprite_animation_finished():
	animatedSprite.stop()
	queue_free()
	pass # Replace with function body.
