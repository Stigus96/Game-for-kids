extends TileMap

var isWallHiding = false

onready var parent = get_parent()

func _ready():
	PlayerData.connect("door_updated", self, "update_door")
	update_door()
	
func update_door() -> void:
	#Shows wall
	if PlayerData.get_door() == true && get_door_value() == true:
		self.visible = true
		self.set_collision_layer(1)
		self.set_collision_mask(1)
	#Hides wall
	elif PlayerData.get_door() == false && get_door_value() == true:
		self.visible = false
		self.set_collision_layer(2)
		self.set_collision_mask(2)

func find_door(value:bool) -> void:
	isWallHiding = value
	
func get_door_value() -> bool:
	return isWallHiding
