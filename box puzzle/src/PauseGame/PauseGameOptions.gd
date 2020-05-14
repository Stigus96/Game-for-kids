extends Control

var music = 0
var sound = 0
var masterVolume = 0

#Changes volume of master audio
func _on_MasterSound_value_changed(value):
	masterVolume = value
	AudioServer.set_bus_volume_db(0, masterVolume)
	pass # Replace with function body.

#Changes volume of music audio
func _on_Music_value_changed(value):
	music = value
	AudioServer.set_bus_volume_db(1, music)
	pass # Replace with function body.

#Changes volume of player audio
func _on_ObjectSound_value_changed(value):
	sound = value
	AudioServer.set_bus_volume_db(2, sound)
	pass # Replace with function body.

#Fullscreen toggle
func _on_CheckBox_pressed():
	OS.window_fullscreen = !OS.window_fullscreen
	pass # Replace with function body.
