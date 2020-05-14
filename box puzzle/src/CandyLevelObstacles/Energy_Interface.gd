extends Control

onready var score: Label = get_node("Label")

# Called when the node enters the scene tree for the first time.
# Connected to the global PlayerData script to update the player score
func _ready():
	PlayerData.connect("energy_updated", self, "update_interface")
	update_interface()
	pass # Replace with function body.
	

#Updates the energy (Speed) for the player in candyland
func update_interface() -> void:
	score.text = "Energy: %s" % PlayerData.player_speed
