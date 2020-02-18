extends KinematicBody2D

func _ready():
	PlayerData.connect("door_updated", self, "update_door")
	update_door()
	
	
func update_door() -> void:
	print(PlayerData.get_door())
	if PlayerData.get_door() == true:
		self.visible = true
		self.set_collision_layer(1)
		self.set_collision_mask(1)
	elif PlayerData.get_door() == false:
		self.visible = false
		self.set_collision_layer(2)
		self.set_collision_mask(2)

		
	

