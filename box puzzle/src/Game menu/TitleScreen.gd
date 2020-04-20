extends Control

onready var playerNode = get_node("CutScene_intro/Player")
onready var music = get_node("IntroMusic")
onready var musicVolume = music.volume_db
onready var levelSelect = get_node("LevelSelect")
onready var optionsMenu = get_node("Options")
onready var mainMenuButtons = get_node("Menu")
onready var cutScene = get_node("CutScene_intro")

func _ready():
	PlayerData.connect("menu_updated", self, "updateMenu")

func _on_newGame_pressed():
	
	var minimumVolume = -80
	var currentVolume = music.get_volume_db()
	var myVolume = 0
	
	playerNode.CutScene_speed = 1

#	while currentVolume > minimumVolume :
#		currentVolume = currentVolume - 15
#		myVolume = music.set_volume_db(currentVolume)
#		print(currentVolume)
#		yield(get_tree().create_timer(0.1), "timeout")
#		if currentVolume <= -80:
#			music.stop()
#			get_tree().change_scene("res://src/Levels/Tutorial.tscn")


func _on_LevelSelect_pressed():
	levelSelect.show()
	mainMenuButtons.hide()
	cutScene.hide()
	
func _on_Options_pressed():
	optionsMenu.show()
	mainMenuButtons.hide()
	cutScene.hide()
	pass
func _on_Quit_pressed():
	get_tree().quit()
	
func updateMenu():
	levelSelect.hide()
	optionsMenu.hide()
	mainMenuButtons.show()
	cutScene.show()

