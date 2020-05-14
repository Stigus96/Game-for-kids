extends Button

onready var blackBtn = get_node("blackBtn")
onready var yellowBtn = get_node("yellowBtn")

func _on_Button_pressed():
	blackBtn.hide()
	yellowBtn.show()
	get_tree().change_scene("res://src/Game menu/TitleScreen.tscn")
	pass # Replace with function body.
