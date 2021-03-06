extends Area2D

export var next_scene: PackedScene

onready var musicFade = get_node("AudioStreamPlayer")

onready var minimumVolume = -80
onready var myVolume = 0

#Starts sound when you enter the portal
func _on_Portal_body_entered(body):
	fade_out_music()
	$AudioStreamPlayer.play()	
	pass # Replace with function body.

#Starts the next level
func teleport() -> void:
	PlayerData.update_checkpointScore() 
	PlayerData.set_lap_time()
	get_tree().change_scene_to(next_scene)

#Fades out the music to a certain level, and the runs the teleport function
func fade_out_music() -> void:
	var currentVolume = musicFade.get_volume_db()
	while currentVolume > minimumVolume :
		currentVolume = currentVolume - 12
		myVolume = musicFade.set_volume_db(currentVolume)
		yield(get_tree().create_timer(0.22), "timeout")
		if currentVolume <= -48:
			musicFade.stop()
			teleport()

