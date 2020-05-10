extends Node2D

onready var Player = get_node("Player")
onready var Stop = get_node("Area2D")
onready var Wizzard = get_node("Wizzard")
onready var CutScene_Timer = get_node("Timer")

onready var numberOfTimeouts = 0

export var next_scene: PackedScene

var wizzard_scale = Vector2(0.166, 0.174)

onready var Bobble = get_node("Control/Bobble")
onready var Lable1 = get_node("Control/Label")
onready var Lable2 = get_node("Control/Label2")
onready var Lable3 = get_node("Control/Label3")
onready var Lable4 = get_node("Control/Label4")
onready var Lable5 = get_node("Control/Label5")



func _on_Area2D_body_entered(body):
	if body.name == "Player":
		Player.CutScene_speed = 0
		Lable1.show()
		Bobble.show()
		CutScene_Timer.start()
		
	pass # Replace with function body.


func _on_Timer_timeout():
	if numberOfTimeouts == 2:
		Lable1.hide()
		Lable2.show()
	if numberOfTimeouts == 6:
		Lable2.hide()
		Lable3.show()
	if numberOfTimeouts == 10:
		Lable3.hide()
		Lable4.show()
	if numberOfTimeouts == 16:
		Lable4.hide()
		Lable5.show()
	if numberOfTimeouts == 21:
		Stop.queue_free()
		Player.CutScene_speed = 1
	if numberOfTimeouts == 22:
		Wizzard.set_scale(wizzard_scale)
	
	numberOfTimeouts += 1
	pass # Replace with function body.



func _on_PortalToNextLevel_body_entered(body):
	if body.name == "Player":
		get_tree().change_scene_to(next_scene)
	pass # Replace with function body.
