extends Area2D

export var score: = 10

func _on_Coin_body_entered(body):
	picked()
	pass # Replace with function body.
	
func picked() -> void:
	PlayerData.score += score
	queue_free()
