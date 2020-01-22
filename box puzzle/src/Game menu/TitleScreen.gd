#Startmenyú.gd
extends Control



func _on_newGame_pressed():
	$Menu/CenterRow/CenterContainer/Buttons/newGame.grab_focus()
	get_tree().change_scene("res://ExampleW1.tscn")
	pass # Replace with function body.

func _on_LevelSelect_pressed():
	get_tree().change_scene("res://LevelSelect.tscn")
	pass # Replace with function body.

func _on_Quit_pressed():
	get_tree().quit()
	pass # Replace with function body.



