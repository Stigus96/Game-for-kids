extends Node2D

#Starts the ingame timer and updates lap variable in PlayerData
func _ready():
	PlayerData.startTimer()
	PlayerData.start_levels()
