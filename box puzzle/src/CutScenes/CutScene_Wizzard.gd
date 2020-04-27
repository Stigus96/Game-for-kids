extends Node2D


onready var PlayerNode = get_node("Player")

onready var timer = get_node("Timer")

onready var StopZone = get_node("StopZone")

onready var horse = get_node("Horse")
onready var wizzard = get_node("StopZone/Sprite")

onready var numberOfTimeouts = 0

var horse_pos = Vector2(233.425, -50.884)
var wizzard_scale = Vector2(0.075, 0.084)

onready var lable1 = get_node("Control/Label")
onready var lable2 = get_node("Control/Label2")
onready var lable3 = get_node("Control/Label3")
onready var lable4 = get_node("Control/Label4")

onready var bird_animation = get_node("Cake/Bird/BirdAnimation")


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


func _on_Timer_timeout():
	if numberOfTimeouts == 2:
		bird_animation.play("Flying")
	elif numberOfTimeouts == 4:
		lable1.hide()
		lable2.show()
	elif numberOfTimeouts == 8:
		lable2.hide()
		lable3.show()
	elif numberOfTimeouts == 12:
		lable3.hide()
		lable4.show()
		PlayerNode.queue_free()
		horse.show()
		horse.set_collision_layer(1)
		horse.set_collision_mask(1)
		horse.set_position(horse_pos)
	elif numberOfTimeouts == 13:
		wizzard.set_scale(wizzard_scale)
		
	numberOfTimeouts += 1
