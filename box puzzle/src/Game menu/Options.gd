extends Control

var music = 0
var sound = 0
var masterVolume = 0

# Changes the volume on the masterbus when using slider
func _on_MasterSound_value_changed(value):
	masterVolume = value
	AudioServer.set_bus_volume_db(0, masterVolume)
	print(AudioServer.get_bus_volume_db(0))
	pass # Replace with function body.
	
# Changes the volume on the background audio bus when using slider
func _on_Music_value_changed(value):
	music = value
	AudioServer.set_bus_volume_db(1, music)
	pass # Replace with function body.

# Changes the volume on the player audio bus when using slider
func _on_ObjectSound_value_changed(value):
	sound = value
	AudioServer.set_bus_volume_db(2, sound)
	print(AudioServer.get_bus_volume_db(2))
	pass # Replace with function body.

# checkbox that toggles fullscreen on or off
func _on_CheckBox_pressed():
	OS.window_fullscreen = !OS.window_fullscreen
	pass # Replace with function body.
