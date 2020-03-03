extends Control

onready var yellowBtn = get_node("Sprite")

func _ready():
	yellowBtn.hide()
	
func _on_Button_pressed():
	yellowBtn.show()
	get_tree().change_scene("res://src/Game menu/TitleScreen.tscn")
	pass # Replace with function body.
	
func _on_Button_mouse_entered():
	yellowBtn.show()
	pass # Replace with function body.
	
func _on_Button_mouse_exited():
	yellowBtn.hide()
	pass # Replace with function body.
