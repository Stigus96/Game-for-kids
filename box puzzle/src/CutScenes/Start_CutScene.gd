extends Node2D

onready var Player = get_node("Player")
onready var Stop = get_node("Area2D")
onready var Wizzard = get_node("Wizzard")
onready var CutScene_Timer = get_node("Timer")

onready var numberOfTimeouts = 0

export var next_scene: PackedScene

var wizzard_scale = Vector2(0.144, 0.151)

onready var Lable1 = get_node("Control/Label")
onready var Lable2 = get_node("Control/Label2")
onready var Lable3 = get_node("Control/Label3")


func _on_Area2D_body_entered(body):
	if body.name == "Player":
		Player.CutScene_speed = 0
		Lable1.show()
		CutScene_Timer.start()
		
	pass # Replace with function body.


func _on_Timer_timeout():
	
	if numberOfTimeouts == 5:
		Lable1.hide()
		Lable2.show()
	if numberOfTimeouts == 10:
		Lable2.hide()
		Lable3.show()
	if numberOfTimeouts == 12:
		Stop.queue_free()
		Player.CutScene_speed = 1
	if numberOfTimeouts == 13:
		Wizzard.set_scale(wizzard_scale)
	
	numberOfTimeouts += 1
	pass # Replace with function body.



func _on_PortalToNextLevel_body_entered(body):
	if body.name == "Player":
		get_tree().change_scene_to(next_scene)
	pass # Replace with function body.
