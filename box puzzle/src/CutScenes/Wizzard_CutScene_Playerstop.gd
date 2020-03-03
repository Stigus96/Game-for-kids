extends Area2D

onready var PlayerNode = get_parent()

func _on_Area2D_body_entered(body):
	if body.name == "Player":
		PlayerNode.get_node("Player").CutScene_speed = 0
		print("Hei1233123")
		
		PlayerNode.start_cutscene()


