extends Control

onready var music = get_node("IntroMusic")
onready var musicVolume = music.volume_db
onready var levelSelect = get_node("LevelSelect")
onready var optionsMenu = get_node("Options")
onready var mainMenuButtons = get_node("Menu")
onready var cutScene = get_node("CutScene_intro")
onready var Player = get_node("CutScene_intro/Player")

func _ready():
	PlayerData.connect("menu_updated", self, "updateMenu")

#plays cutscene and starts new game
func _on_newGame_pressed():
	
	var minimumVolume = -80
	var currentVolume = music.get_volume_db()
	var myVolume = 0
	
	Player.CutScene_speed = 1

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

#Stops the player in the cutscene
func _on_PlayerStop_body_entered(body):
	if body.name == "Player":
		Player.CutScene_speed = 0
	pass # Replace with function body.
