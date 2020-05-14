extends Node2D


onready var PlayerNode = get_node("Player")

onready var timer = get_node("Timer")

onready var StopZone = get_node("StopZone")

onready var horse = get_node("Horse")
onready var wizzard = get_node("StopZone/Sprite")

onready var numberOfTimeouts = 0

var horse_pos = Vector2(233.425, -50.884)
var wizzard_scale = Vector2(0.075, 0.084)

onready var bobble = get_node("Control/Bobble")
onready var lable1 = get_node("Control/Label")
onready var lable2 = get_node("Control/Label2")
onready var lable3 = get_node("Control/Label3")
onready var lable4 = get_node("Control/Label4")

onready var bird_animation = get_node("Cake/Bird/BirdAnimation")

#Starts to move the player when the level starts
func _ready():
	start_Player()
	print(timer)
	pass

#Function to stop the player
func stop_Player() -> void:
	PlayerNode.CutScene_speed = 0

#Function to start the player
func start_Player() -> void:
	PlayerNode.CutScene_speed = 1
	
#Shows the first talking bobble, and starts the timer
func start_cutscene() -> void:
	bobble.show()
	lable1.show()
	timer.start()

#Runs though all the dialog, changes the player to a horse, and plays animations
func _on_Timer_timeout():
	if numberOfTimeouts == 2:
		bird_animation.play("Flying")
	elif numberOfTimeouts == 4:
		lable1.hide() #Dialog
		lable2.show() #Dialog
	elif numberOfTimeouts == 8:
		lable2.hide() #Dialog
		lable3.show() #Dialog
	elif numberOfTimeouts == 12:
		lable3.hide() #Dialog
		lable4.show() #Dialog
		PlayerNode.queue_free()
		horse.show()
		horse.set_collision_layer(1) #Changes the player to a horse
		horse.set_collision_mask(1) #Changes the player to a horse
		horse.set_position(horse_pos) #Changes the player to a horse
	elif numberOfTimeouts == 13:
		wizzard.set_scale(wizzard_scale) #Turns the wizzard around
		
	numberOfTimeouts += 1
