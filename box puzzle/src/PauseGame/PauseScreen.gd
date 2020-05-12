extends Control

onready var optionsMenu = get_node("Options")
onready var mainMenuButtons = get_node("MarginContainer")

func _ready():
	PlayerData.connect("menu_updated", self, "backtoMenuButtons")


func _physics_process(delta):
	if $MarginContainer/CenterContainer/VBoxContainer/Continue.is_hovered() == true:
		$MarginContainer/CenterContainer/VBoxContainer/Continue.grab_focus()
	
	if $MarginContainer/CenterContainer/VBoxContainer/Restart.is_hovered() == true:
		$MarginContainer/CenterContainer/VBoxContainer/Restart.grab_focus()
	
	if $MarginContainer/CenterContainer/VBoxContainer/ReturnToMenu.is_hovered():
		$MarginContainer/CenterContainer/VBoxContainer/ReturnToMenu.grab_focus()

func _input(event):
	if event.is_action_pressed("ui_cancel"):
		mainMenuButtons.show()
		optionsMenu.hide()
		$MarginContainer/CenterContainer/VBoxContainer/Continue.grab_focus()
		get_tree().paused = not get_tree().paused
		visible = not visible
		

func _on_Continue_pressed():
	get_tree().paused = not get_tree().paused
	visible = not visible

func _on_Restart_pressed():
	get_tree().paused = not get_tree().paused
	get_tree().reload_current_scene()

func _on_Options_pressed():
	optionsMenu.show()
	mainMenuButtons.hide()

func backtoMenuButtons():
	optionsMenu.hide()
	mainMenuButtons.show()

func _on_ReturnToMenu_pressed():
	get_tree().paused = not get_tree().paused
	get_tree().change_scene("res://src/Game menu/TitleScreen.tscn")


func _on_Quit_pressed():
	get_tree().quit()



