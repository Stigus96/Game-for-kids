extends Area2D

onready var PlayerNode = get_parent()


func _ready():
	pass


func _on_Area2D_body_entered(body):
	PlayerNode.get_node("Player").update_playerAutoMov(false)
	print(PlayerNode)
	pass # Replace with function body.
