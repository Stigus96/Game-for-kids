extends Node

signal score_updated
signal door_updated
signal ladder_update


var player_speed = 1

var score: = 0 setget set_score

var door = true setget set_door

var ladder = false setget set_ladder


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

func set_door(value: bool) -> void:
	door = value
	emit_signal("door_updated")

func get_door() -> bool:
	return door

func set_ladder(value: bool) -> void:
	ladder = value
	emit_signal("ladder_updated")
	
func get_ladder() -> bool:
	return ladder
	
func get_player_speed() -> float:
	return player_speed
	
func update_player_speed(value: bool) -> void:
	if value == true:
		print("candyPickedUp")
		player_speed += 0.2
		
	elif value == false:
		print("heioghå")
		player_speed -= 0.2
		
func reset_player_speed() -> void:
	player_speed = 1
