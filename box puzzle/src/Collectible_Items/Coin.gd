extends Area2D

export var score: = 10

onready var playerAnimation = get_node("AnimationPlayer")
onready var coinSound = get_node("AudioStreamPlayer")

func _on_Coin_body_entered(body) -> void:
	
	if body.name == "Player":
		playerAnimation.play("fade_out")
		coinSound.play()
		picked()
	pass # Replace with function body.
	
func picked() -> void:
	PlayerData.score += score
