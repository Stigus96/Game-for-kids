extends Node

signal score_updated

signal door_updated

var score: = 0 setget set_score

var door = true

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

func set_door(value:bool )->void:
	door = value
	emit_signal("score_updated")
	
	
func get_door()->bool:
	return door