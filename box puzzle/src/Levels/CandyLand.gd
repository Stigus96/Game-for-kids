extends Node2D

export var next_scene: PackedScene

onready var horse = get_node("KinematicBody2D/Horse")
onready var AnimatedHorse = get_node("KinematicBody2D/Horse/AnimatedHorse")
onready var killzone = get_node("KinematicBody2D")
onready var bird = get_node("KinematicBody2D/Bird/AnimationPlayer")

onready var TalkingBobble = get_node("KinematicBody2D/Sprite")
onready var Lable1 = get_node("KinematicBody2D/Sprite/Label")
onready var Lable2 = get_node("KinematicBody2D/Sprite/Label2")
onready var Lable3 = get_node("KinematicBody2D/Sprite/Label3")

onready var fadeout = get_node("KinematicBody2D/Fadeout/AnimationPlayer")

onready var EndTimer = get_node("KinematicBody2D/Timer")

var numberOfTimeouts = 0

func _on_EndCutscene_body_entered(body):
	if body.name == "Horse":
		horse.speedCut = 0
		AnimatedHorse.play("default")
		killzone.speed = 0
	pass # Replace with function body.


func _on_BirdFlyAway_body_entered(body):
	if body.name == "Horse":
		bird.play("Fly_Away")
		EndTimer.start()
	pass # Replace with function body.


func _on_Timer_timeout():
	if numberOfTimeouts == 1:
		TalkingBobble.show()
		Lable1.show()
	elif numberOfTimeouts == 5:
		Lable1.hide()
		Lable2.show()
	elif numberOfTimeouts == 9:
		Lable2.hide()
		Lable3.show()
	elif numberOfTimeouts == 12:
		fadeout.play("Fadeout")
	elif numberOfTimeouts == 15:
		get_tree().change_scene_to(next_scene)
	
	numberOfTimeouts += 1
	pass # Replace with function body.
