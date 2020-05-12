extends Area2D

export var healthPoints: = 5

var fade_out = "fade_out"


onready var playerAnimation = get_node("AnimationPlayer")

#When the player enters the donut, an animation is played 
func _on_Donut_body_entered(body) -> void: 
	if body.name == "Player":
		playerAnimation.play("fade_out")
	pass # Replace with function body.
