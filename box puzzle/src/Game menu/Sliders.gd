extends HSlider

func _on_HSlider_value_changed(value):
	PlayerData.update_volume("Sliders")
	pass # Replace with function body.
