extends Control

 
onready var score: Label = get_node("Label")

# Called when the node enters the scene tree for the first time.
func _ready():
	PlayerData.connect("score_updated", self, "update_interface")
	update_interface()
	pass # Replace with function body.
	
func update_interface() -> void:
	score.text = "score: %s" % PlayerData.score
	print(score)