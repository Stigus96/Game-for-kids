#Startmenu.gd
extends Control

#func _ready():
#	if $Menu/CenterRow/CenterContainer/Buttons/newGame.is_hovered() == true:
#		$Menu/CenterRow/CenterContainer/Buttons/newGame.grab_focus()

func _on_newGame_pressed():
	get_node("CutScene_intro/Player").CutScene_speed = 1
	
func _on_LevelSelect_pressed():
	get_tree().change_scene("res://.tscn")
	
func _on_Options_pressed():
	get_tree().change_scene("res://.tscn")
	
func _on_Quit_pressed():
	get_tree().quit()





