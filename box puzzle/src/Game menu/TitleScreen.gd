#Startmenu.gd
extends Control

func _on_newGame_pressed():
	get_tree().change_scene("res://src/Levels/DemoMap/DemoWorld.tscn")
	pass # Replace with function body.

func _on_LevelSelect_pressed():
	get_tree().change_scene("res://.tscn")
	pass # Replace with function body.
	
func _on_Options_pressed():
	get_tree().change_scene("res://.tscn")
	pass # Replace with function body.

func _on_Quit_pressed():
	get_tree().quit()
	pass # Replace with function body.





