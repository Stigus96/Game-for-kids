extends Node2D

onready var horse = get_node("Horse")
onready var AnimatedHorse = get_node("Horse/AnimatedHorse")
onready var killzone = get_node("KinematicBody2D")
onready var bird = get_node("Bird/AnimationPlayer")

func _on_EndCutscene_body_entered(body):
	if body.name == "Horse":
		horse.speedCut = 0
		AnimatedHorse.play("default")
		killzone.speed = 0
	pass # Replace with function body.


func _on_BirdFlyAway_body_entered(body):
	if body.name == "Horse":
		bird.play("Fly_Away")
	pass # Replace with function body.
