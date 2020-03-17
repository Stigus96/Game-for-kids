extends Control

onready var yellowBtn = get_node("Sprite")
onready var returnToMenu = get_parent()


func _ready():
	yellowBtn.hide()
	
func _on_Button_pressed():
	yellowBtn.show()
	returnToMenu.hide()
	PlayerData.main_menu_update("menu")
	pass # Replace with function body.
	
func _on_Button_mouse_entered():
	yellowBtn.show()
	pass # Replace with function body.
	
func _on_Button_mouse_exited():
	yellowBtn.hide()
	pass # Replace with function body.
