extends Area2D

func _ready():
	pass # Replace with function body.

onready var parent = get_parent()

func _on_Spikes_body_entered(body):
	if body.name == "Player":
		get_tree().reload_current_scene()
	pass # Replace with function body.

func hideSpike() -> void:
	self.visible = false
	self.set_collision_layer(2)
	self.set_collision_mask(2)
	pass
	
func showSpike() -> void:
	self.visible = true
	self.set_collision_layer(1)
	self.set_collision_mask(1)
	pass
