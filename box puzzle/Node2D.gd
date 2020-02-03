extends Node

signal score_updated

var score: = 0 setget set_score

#PlayerData.score += 1

func set_score(value: int) -> void:
	score = value
	emit_signal("score_updated")
	print(score)
	return
	
func reset() -> void:
	score = 0


func _ready():
	pass # Replace with function body.

func coin_collected():
	score += 1
	pass