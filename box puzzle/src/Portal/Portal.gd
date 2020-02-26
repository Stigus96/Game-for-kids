extends Area2D

export var next_scene: PackedScene

onready var music = get_node("../AudioStreamPlayer")

onready var minimumVolume = -80
onready var myVolume = 0


func _on_Portal_body_entered(body):
	fade_out_music()
	pass # Replace with function body.
	
func teleport() -> void:
	get_tree().change_scene_to(next_scene)

func fade_out_music() -> void:
	var currentVolume = music.get_volume_db()
	while currentVolume > minimumVolume :
		currentVolume = currentVolume - 12
		myVolume = music.set_volume_db(currentVolume)
		print(currentVolume)
		yield(get_tree().create_timer(0.1), "timeout")
		if currentVolume <= -80:
			print(currentVolume)
			music.stop()
			teleport()

