extends Control

onready var score: Label = get_node("Label")

# Called when the node enters the scene tree for the first time.
func _ready():
	PlayerData.connect("score_updated", self, "update_interface")
	PlayerData.connect("time_reset_updated", self, "time_reset_updated3")
	PlayerData.connect("Game_Started", self, "Game_Started")
	update_interface()
	pass # Replace with function body.

#Updates the score text in the level.
func update_interface() -> void:
	score.text = "Coins: %s" % PlayerData.score
	print(score)

#When the game starts, the score is shown
func Game_Started() -> void:
	self.show()
	score.show()

#When the game is reset, the score is net to 0
func time_reset_updated3() -> void:
	score.text = "Coins: %s" % PlayerData.score
	self.hide()
