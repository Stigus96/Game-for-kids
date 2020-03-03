extends Control

func _on_tutorialBtn_pressed():
	get_tree().change_scene("res://src/Levels/Tutorial.tscn")
	pass

func _on_grassLevelBtn_pressed():
	get_tree().change_scene("res://src/Levels/GrassLevel/GrassLevel.tscn")
	pass

func _on_caveLevelBtn_pressed():
	get_tree().change_scene("res://src/Levels/caveLevel.tscn")
	pass

func _on_TBDBtn_pressed():
	get_tree().change_scene("")
	pass

func _on_TBDBtn2_pressed():
	get_tree().change_scene("")
	pass

func _on_candylandBtn_pressed():
	get_tree().change_scene("")
	pass

