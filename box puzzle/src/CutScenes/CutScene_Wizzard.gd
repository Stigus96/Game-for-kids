extends Node2D


onready var PlayerNode = get_node("Player")

onready var timer = get_node("Timer")

onready var StopZone = get_node("StopZone")

onready var numberOfTimeouts = 0

var horse_pos = Vector2(484.635, 715.708)

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
	#PlayerData.started_candyland()
	#PlayerData.set_player_Pos()
	#horse.get_position_in_parent()
	#horse.set_position(PlayerData.player_pos)
	if numberOfTimeouts == 0:
		bird_animation.play("Flying")
	elif numberOfTimeouts == 2:
		lable1.hide()
		lable2.show()
	elif numberOfTimeouts == 6:
		lable2.hide()
		lable3.show()
	elif numberOfTimeouts == 10:
		lable3.hide()
		lable4.show()
		PlayerNode.queue_free()
		
	numberOfTimeouts += 1
