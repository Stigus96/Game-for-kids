extends Node2D

onready var PlayerNode = get_node("Player")

onready var StopZone = get_node("StopZone")

func _ready():
	start_Player()
	pass

func stop_Player() -> void:
	PlayerNode.update_playerAutoMov(false)

func start_Player() -> void:
	PlayerNode.update_playerAutoMov(true)