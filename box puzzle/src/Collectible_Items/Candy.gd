extends Area2D

export var score: = 50


onready var playerAnimation = get_node("AnimationPlayer")

func _on_Cake_body_entered(body) -> void:
	playerAnimation.play("fade_out")
	picked()
	pass # Replace with function body.
	
func picked() -> void:
	PlayerData.score += score
