extends Control

#Changes scene depending on which button is presset

func _on_tutorialBtn_pressed():
	get_tree().change_scene("res://src/Levels/Tutorial.tscn")
	pass

func _on_grassLevelBtn_pressed():
	get_tree().change_scene("res://src/Levels/GrassLevel/GrassLevel.tscn")
	pass

func _on_caveLevelBtn_pressed():
	get_tree().change_scene("res://src/Levels/caveLevel.tscn")
	pass

func _on_IceLevelBtn_pressed():
	get_tree().change_scene("res://src/Levels/IceLevel.tscn")
	pass # Replace with function body.


func _on_CastleLevelBtn_pressed():
	get_tree().change_scene("res://src/Levels/CastleLevel.tscn")
	pass # Replace with function body.


func _on_candylandBtn_pressed():
	get_tree().change_scene("res://src/Levels/CandyLand.tscn")
	pass



