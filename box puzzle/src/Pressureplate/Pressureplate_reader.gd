extends Area2D

onready var tileWall = get_node("TileMap5")

func _ready():
	pass # Replace with function body.

func _on_Pressureplate_reader_body_entered(body):
	if body.name == "Player" || body.name == "PhysicsBox2":
		tileWall.hide()
		tileWall.set_collision_layer(2)
		tileWall.set_collision_mask(2)
	pass # Replace with function body.


func _on_Pressureplate_reader_body_exited(body):
	if body.name == "Player" || body.name == "PhysicsBox2":
		tileWall.show()
		tileWall.set_collision_layer(1)
		tileWall.set_collision_mask(1)
	pass # Replace with function body.
	
