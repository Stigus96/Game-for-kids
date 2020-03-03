extends Area2D
export var player_speed: = 1

onready var hinder_down = get_node("Sprite")
onready var hinder_up = get_node("pixil-frame-0")


onready var playerAnimation = get_node("AnimationPlayer")
	
func picked() -> void:
	PlayerData.update_player_speed(false)



func _on_HesteHinder_body_entered(body):
	if body.name == "Horse":
		playerAnimation.play("fade_out")
		player_speed = player_speed + 1
		picked()
		
		hinder_up.hide()
		hinder_down.show()
	pass # Replace with function body.
