extends Node

signal score_updated
signal door_updated
signal ladder_updated
signal energy_updated
signal color_door_updated
signal menu_updated

var player_speed = 1

var score: = 0 setget set_score

var door = true setget set_door

var ladder = false setget set_ladder


#Updates the score
func set_score(value: int) -> void:
	score = value
	emit_signal("score_updated")
	print(score)
	return
	
#Resets the score
func reset() -> void:
	score = 0

#Increase the score
func coin_collected():
	score += 1
	pass

#Updates the door to either true or false 
func set_door(value: bool) -> void:
	door = value
	emit_signal("door_updated")

#Returns the value of the door
func get_door() -> bool:
	return door

#Updates the door to either true or false 
func set_ladder(value: bool) -> void:
	ladder = value
	emit_signal("ladder_updated")
	
#Returns the value of the door
func get_ladder() -> bool:
	return ladder
	
#Returns the speed of the player
func get_player_speed() -> float:
	return player_speed
	
#updates the speed of the player in Candyland if triggered
func update_player_speed(value: bool) -> void:
	if value == true:
		if player_speed < 1.4:
			player_speed += 0.1
			emit_signal("energy_updated")
		
	elif value == false:
		player_speed -= 0.1
		emit_signal("energy_updated")
		
#resets the player speed
func reset_player_speed() -> void:
	player_speed = 1
	emit_signal("energy_updated")
	
func set_color_door(value: bool) -> void:
	door = value
	emit_signal("color_door_updated")
	
func get_color_door() -> bool:
	return door
	
func main_menu_update(value: String) -> void:
	emit_signal("menu_updated")

