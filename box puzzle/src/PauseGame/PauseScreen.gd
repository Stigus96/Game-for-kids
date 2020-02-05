extends Control

func _physics_process(delta):
	if $MarginContainer/CenterContainer/VBoxContainer/Continue.is_hovered() == true:
		$MarginContainer/CenterContainer/VBoxContainer/Continue.grab_focus()
	
	if $MarginContainer/CenterContainer/VBoxContainer/Restart.is_hovered() == true:
		$MarginContainer/CenterContainer/VBoxContainer/Restart.grab_focus()
	
	if $MarginContainer/CenterContainer/VBoxContainer/ReturnToMenu.is_hovered():
		$MarginContainer/CenterContainer/VBoxContainer/ReturnToMenu.grab_focus()

func _input(event):
	if event.is_action_pressed("ui_cancel"):
		$MarginContainer/CenterContainer/VBoxContainer/Continue.grab_focus()
		get_tree().paused = not get_tree().paused
		visible = not visible

func _on_Continue_pressed():
	get_tree().paused = not get_tree().paused
	visible = not visible

func _on_Restart_pressed():
	get_tree().paused = not get_tree().paused
	get_tree().reload_current_scene()


func _on_ReturnToMenu_pressed():
	get_tree().paused = not get_tree().paused
	get_tree().change_scene("res://src/Game menu/TitleScreen.tscn")


func _on_Quit_pressed():
	get_tree().quit()
