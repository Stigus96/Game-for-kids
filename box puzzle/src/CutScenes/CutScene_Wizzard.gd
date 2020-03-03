extends Node2D

onready var parent = get_parent()

onready var PlayerNode = get_node("Player")

onready var timer = get_node("Timer")

onready var StopZone = get_node("StopZone")

onready var numberOfTimeouts = 0

onready var lable1 = get_node("Label")
onready var lable2 = get_node("Label2")
onready var lable3 = get_node("Label3")
onready var lable4 = get_node("Label4")

onready var bird_animation = get_node("Cake/Bird/BirdAnimation")

var state = false

func _ready():
	start_Player()
	print(timer)
	pass

func stop_Player() -> void:
	PlayerNode.CutScene_speed = 0

func start_Player() -> void:
	PlayerNode.CutScene_speed = 1
	
func start_cutscene() -> void:
	lable1.show()
	timer.start()
	
func get_area_state()->bool:
	return get_state()


func _on_Timer_timeout():
	if numberOfTimeouts == 0:
		lable1.hide()
		lable2.show()
		bird_animation.play("Flying")
	elif numberOfTimeouts == 1:
		lable2.hide()
		lable3.show()
	elif numberOfTimeouts == 2:
		lable3.hide()
		lable4.show()
		state = true
	elif numberOfTimeouts == 3:
		lable4.hide()
		
	numberOfTimeouts += 1

func get_state()->bool:
	return state
