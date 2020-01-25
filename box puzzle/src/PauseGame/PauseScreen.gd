extends Control

#func _ready():
#	$MarginContainer/CenterContainer/VBoxContainer/TextureButton.grab_focus()

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