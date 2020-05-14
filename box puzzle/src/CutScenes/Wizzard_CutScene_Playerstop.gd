extends Area2D

onready var PlayerNode = get_parent()

#If the player enters this body, it sets the cutscene speed (Movement of the player in the cutscene) to 0
func _on_Area2D_body_entered(body):
	if body.name == "Player":
		PlayerNode.get_node("Player").CutScene_speed = 0
		
		#Starts the cutscene
		PlayerNode.start_cutscene()


