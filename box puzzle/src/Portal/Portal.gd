extends Area2D

export var next_scene: PackedScene

onready var musicFade = get_node("AudioStreamPlayer")

onready var minimumVolume = -80
onready var myVolume = 0

func _on_Portal_body_entered(body):
	fade_out_music()
	$AudioStreamPlayer.play()
	pass # Replace with function body.

func teleport() -> void:
	get_tree().change_scene_to(next_scene)

func fade_out_music() -> void:
	print(musicFade)
	var currentVolume = musicFade.get_volume_db()
	while currentVolume > minimumVolume :
		currentVolume = currentVolume - 12
		myVolume = musicFade.set_volume_db(currentVolume)
		print(currentVolume)
		yield(get_tree().create_timer(0.2), "timeout")
		if currentVolume <= -48:
			print(currentVolume)
			musicFade.stop()
			teleport()

