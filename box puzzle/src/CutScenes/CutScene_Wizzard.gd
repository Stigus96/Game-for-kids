extends Node2D

onready var parent = get_parent()

onready var PlayerNode = get_node("Player")

onready var timer = get_node("Timer")

onready var StopZone = get_node("StopZone")

onready var numberOfTimeouts = 0

var horse_pos = Vector2(484.635, 715.708)

onready var lable1 = get_node("Label")
onready var lable2 = get_node("Label2")
onready var lable3 = get_node("Label3")
onready var lable4 = get_node("Label4")

onready var movingScene = parent.get_node("KinematicBody2D")

onready var horse = parent.get_node("Horse")

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
		lable1.hide()
		lable2.show()
		bird_animation.play("Flying")
	elif numberOfTimeouts == 1:
		lable2.hide()
		lable3.show()
	elif numberOfTimeouts == 2:
		lable3.hide()
		lable4.show()
		horse.set_collision_mask(1)
		horse.set_collision_layer(1)
		PlayerNode.queue_free()
		horse.show()
		horse.set_position(horse_pos)
		movingScene.hay = true
		movingScene._physics_process(true)
	elif numberOfTimeouts == 3:
		lable4.hide()
		
	numberOfTimeouts += 1
