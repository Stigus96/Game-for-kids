extends Area2D

export var score: = 50
export var player_speed: = 1


onready var playerAnimation = get_node("AnimationPlayer")
onready var chewingSound = get_node("AudioStreamPlayer")

#When the player enters the candy, sound is played, animation is played, and the player speed is increased.
func _on_Cake_body_entered(body) -> void:
	chewingSound.play()
	playerAnimation.play("fade_out")
	player_speed = player_speed + 1
	picked()
	pass # Replace with function body.

#Updates the player speed, and increase the score
func picked() -> void:
	PlayerData.update_player_speed(true)
	PlayerData.score += score
