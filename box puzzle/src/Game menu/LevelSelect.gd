extends Control

#func _physics_process(delta):
#	if $TextureRect/tutorialBtn.is_hovered() == true:
#		$TextureRect/tutorialBtn.grab_focus()
#
#	if $TextureRect/grassLevelBtn.is_hovered() == true:
#		$TextureRect/grassLevelBtn.grab_focus()
#
#	if $TextureRect/caveLevelBtn.is_hovered() == true:
#		$TextureRect/caveLevelBtn.grab_focus()
#
#	if $TextureRect/TBDBtn.is_hovered() == true:
#		$TextureRect/TBDBtn.grab_focus()
#
#	if $TextureRect/TBDBtn2.is_hovered() == true:
#		$TextureRect/TBDBtn2.grab_focus()
#
#	if $TextureRect/candylandBtn.is_hovered() == true:
#		$TextureRect/candylandBtn.grab_focus()
#
#func _input(event):
#	if event.get_local_scene():
#		$TextureRect/tutorialBtn.grab_focus()

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




