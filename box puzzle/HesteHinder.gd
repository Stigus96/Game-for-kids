extends Area2D
export var player_speed: = 1


onready var playerAnimation = get_node("AnimationPlayer")

func _on_Cake_body_entered(body) -> void:
	playerAnimation.play("fade_out")
	player_speed = player_speed + 1
	picked()
	pass # Replace with function body.
	
func picked() -> void:
	PlayerData.update_player_speed(false)

