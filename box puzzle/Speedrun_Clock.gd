extends Control

onready var score: Label = get_node("Label")
onready var time2: Label = get_node("Label2")
onready var time3: Label = get_node("Label3")
onready var time4: Label = get_node("Label4")
onready var time5: Label = get_node("Label5")
onready var time6: Label = get_node("Label6")
onready var time7: Label = get_node("Label7")

onready var faker = get_node("Label2")

var lap = 1

# Called when the node enters the scene tree for the first time.
func _ready():
	PlayerData.connect("time_updated", self, "update_interface")
	PlayerData.connect("lap_updated", self, "lap_interface")
	update_interface()
	lap_interface()
	pass # Replace with function body.
	
func update_interface() -> void:
	score.text = "Time: %s" % PlayerData.time

func lap_interface() -> void:
	print("fasdfgawd")
	if lap == 1:
		time2.text = "Tutorial: %s" % PlayerData.time
		faker.show()
	if lap == 2:
		time3.show()
		time3.text = "Grass: %s" % PlayerData.time
	if lap == 3:
		time4.show()
		time4.text = "Ice: %s" % PlayerData.time
	if lap == 4:
		time5.show()
		time5.text = "Cave: %s" % PlayerData.time
	if lap == 5:
		time6.show()
		time6.text = "Castle: %s" % PlayerData.time
	
	lap += 1
