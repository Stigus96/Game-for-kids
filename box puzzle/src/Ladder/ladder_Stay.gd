extends Area2D

var isLadderHiding = false

onready var parent = get_parent()

func _on_ladder_body_entered(body):
	if body.name == "Player":
		PlayerData.set_ladder(true)

func _on_ladder_body_exited(body):
	if body.name == "Player":
		PlayerData.set_ladder(false)
		pass


func show_Ladder() -> void:
		self.visible = true
		self.set_collision_layer(1)
		self.set_collision_mask(1)
		parent.update_pressureplate_child(false)

func hide_Ladder() -> void:
		self.visible = false
		self.set_collision_layer(2)
		self.set_collision_mask(2)
		
func find_ladder(value:bool) -> void:
	isLadderHiding = value
	
func get_ladder_value() -> bool:
	return isLadderHiding