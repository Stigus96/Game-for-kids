extends KinematicBody2D

#Value to see if the wall is hiding or not
var isWallHiding = false

onready var parent = get_parent()

# Called when the node enters the scene tree for the first time.
func _ready():
	PlayerData.connect("door_updated", self, "update_door")
	update_door()

#Updates the door
func update_door() -> void:
		#Makes the door visible
	if PlayerData.get_door() == true && get_door_value() == true:
		self.visible = true
		self.set_collision_layer(1)
		self.set_collision_mask(1)
		#Makes the door invisible
	elif PlayerData.get_door() == false && get_door_value() == true:
		self.visible = false
		self.set_collision_layer(2)
		self.set_collision_mask(2)

#Sets the value of isWallHiding
func find_door(value:bool) -> void:
	isWallHiding = value
	
#Gets the value of isWallHiding
func get_door_value() -> bool:
	return isWallHiding
