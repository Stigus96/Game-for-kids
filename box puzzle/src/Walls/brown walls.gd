extends TileMap

var isWallHiding = false

func _ready():
	PlayerData.connect("color_door_updated", self, "update_color_door")
	update_color_door()
	
func update_color_door() -> void:
	if PlayerData.get_color_door() == true:
		self.visible = true
		self.set_collision_layer(1)
		self.set_collision_mask(1)
	elif PlayerData.get_color_door() == false:
		self.visible = false
		self.set_collision_layer(2)
		self.set_collision_mask(2)

