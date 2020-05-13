extends Control

onready var score: Label = get_node("Label")
onready var time2: Label = get_node("Label2")
onready var time3: Label = get_node("Label3")
onready var time4: Label = get_node("Label4")
onready var time5: Label = get_node("Label5")
onready var time6: Label = get_node("Label6")
onready var time7: Label = get_node("Label7")

onready var faker = get_node("Label2")

# Called when the node enters the scene tree for the first time.
func _ready():
	PlayerData.connect("time_updated", self, "update_interface")
	PlayerData.connect("lap_updated", self, "lap_interface")
	PlayerData.connect("time_reset_updated", self, "time_reset_updated2")
	PlayerData.connect("Game_Started", self, "Game_Started")
	update_interface()
	lap_interface()
	pass # Replace with function body.
	
func update_interface() -> void:
	score.text = "Time: %s" % PlayerData.time

func lap_interface() -> void:
	if PlayerData.lap == 0:
		time2.text = "Tutorial:"
		time3.text = "Grass:"
		time4.text = "Ice:"
		time5.text = "Cave:"
		time6.text = "Castle:"
		PlayerData.lap += 1
	elif PlayerData.lap == 1:
		time2.text = "Tutorial: %s" % PlayerData.time
		faker.show()
		PlayerData.lap += 1
	elif PlayerData.lap == 2:
		time3.show()
		PlayerData.lap += 1
		time3.text = "Grass: %s" % PlayerData.time
	elif PlayerData.lap == 3:
		time4.show()
		PlayerData.lap += 1
		time4.text = "Ice: %s" % PlayerData.time
	elif PlayerData.lap == 4:
		time5.show()
		PlayerData.lap += 1
		time5.text = "Cave: %s" % PlayerData.time
	elif PlayerData.lap == 5:
		time6.show()
		PlayerData.lap += 1
		time6.text = "Castle: %s" % PlayerData.time
		
	print(PlayerData.lap)

func Game_Started() -> void:
	self.show()
	score.show()

func time_reset_updated2() -> void:
		score.hide()
		time2.hide()
		time3.hide()
		time4.hide()
		time5.hide()
		time6.hide()
		
		time2.text = "Tutorial:"
		time3.text = "Grass:"
		time4.text = "Ice:"
		time5.text = "Cave:"
		time6.text = "Castle:"
		
		PlayerData.SpeedrunTimer.stop()
		PlayerData.minutes = 0
		PlayerData.seconds = 0
		PlayerData.tenths = 0
