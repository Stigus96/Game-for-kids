extends Area2D

export var score: = 10

var fade_out = "fade_out"

#onready var anim_player: AnimationPlayer = get_node("AnimationPlayer")

onready var ANI = get_node("AnimationPlayer")

func _on_Coin_body_entered(body) -> void:
	ANI.play(fade_out)
	picked()
	pass # Replace with function body.
	
func picked() -> void:
	PlayerData.score += score
	queue_free()
