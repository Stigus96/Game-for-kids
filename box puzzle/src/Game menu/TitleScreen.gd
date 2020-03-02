#Startmenu.gd
extends Control


onready var music = get_node("IntroMusic")
onready var musicVolume = music.volume_db

func _on_newGame_pressed():
	var minimumVolume = -80
	var currentVolume = music.get_volume_db()
	var myVolume = 0
	
	while currentVolume > minimumVolume :
		currentVolume = currentVolume - 5
		myVolume = music.set_volume_db(currentVolume)
		print(currentVolume)
		yield(get_tree().create_timer(0.1), "timeout")
		if currentVolume <= -80:
			music.stop()
			get_tree().change_scene("res://src/Levels/Tutorial.tscn")


func _on_LevelSelect_pressed():
	get_tree().change_scene("res://src/Game menu/LevelSelect.tscn")
	
func _on_Options_pressed():
	get_tree().change_scene("res://.tscn")
	
func _on_Quit_pressed():
	get_tree().quit()

