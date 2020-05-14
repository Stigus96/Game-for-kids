extends Node

onready var SpeedrunTimer = get_node("Timer")

var minutes = 0
var seconds = 0
var tenths = 0

var time = ""

var lap = 0

onready var parent = get_parent()

#Signals that get sendt out and picked up in other scripts
signal time_updated
signal lap_updated
signal time_reset_updated
signal Game_Started
signal score_updated
signal door_updated
signal ladder_updated
signal energy_updated
signal color_door_updated
signal menu_updated

var player_speed = 1

var score: = 0 setget set_score
var checkpointScore = 0 setget set_checkpointScore

var door = true setget set_door

var ladder = false setget set_ladder


#Updates the score
func set_score(value: int) -> void:
	score = value
	emit_signal("score_updated")
	return

func start_levels() -> void:
	emit_signal("Game_Started")

#Resets the score and the lap variable. Sends out a signal that the game has been reset
func reset() -> void:
	lap = 0
	score = 0
	emit_signal("time_reset_updated")

#Starts the timer
func startTimer() -> void:
	SpeedrunTimer.start()

#Increase the score
func coin_collected():
	score += 1
	pass

#Changes the score to what the checkpoint score is
func set_checkpointScore(value: int) -> void:
	score = get_checkpoint_Score()
	emit_signal("score_updated")
	return

#Returns the checkpoint score
func get_checkpoint_Score():
	return checkpointScore

#Updates the checkpoint score to what the score is now
func update_checkpointScore():
	checkpointScore = score

#Updates the door value to True or false (Gets used when you press the pressureplate)
#and sends out a signal that it has been updated
func set_door(value: bool) -> void:
	door = value
	emit_signal("door_updated")

#Returns door(If the door is visible or not)
func get_door() -> bool:
	return door

#Sets ladder value to true or false, and sends out a signal that the laddervariable is updated
func set_ladder(value: bool) -> void:
	ladder = value
	emit_signal("ladder_updated")
	
#Returns the ladder value
func get_ladder() -> bool:
	return ladder
	
#Returns the speed of the player
func get_player_speed() -> float:
	return player_speed
	
#updates the speed of the player in Candyland if triggered
func update_player_speed(value: bool) -> void:
	#If you pick up a candy, the speed increase
	if value == true:
		if player_speed < 1.4:
			player_speed += 0.1
			emit_signal("energy_updated")
	#If a timer is triggered, you lose speed
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

#Sends out a signal that the lap time is updated
func set_lap_time() -> void:
	emit_signal("lap_updated")
	pass

#Returns the lap time
func get_lap_time():
	return time

func stop_Time():
	SpeedrunTimer.stop()

#Timout for the ingame timer
func _on_Timer_timeout():
	#Counts up the seconds each 10th of a second
	if seconds > 59:
		seconds = 0
		minutes += 1
	elif tenths == 9:
		tenths = 0
		seconds += 1
	else:
		tenths += 1
	
	#Changes the timer value for the user
	if seconds < 10:
		time = str(minutes) + ":0" + str(seconds) + ":" + str(tenths)
	else:
		time = str(minutes) + ":" + str(seconds) + ":" + str(tenths)
	emit_signal("time_updated")
