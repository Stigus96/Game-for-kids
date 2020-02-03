extends Area2D

export var score: = 50
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Cake_body_entered(body):
	picked()
	pass # Replace with function body.
	
func picked() -> void:
	PlayerData.score += score
	queue_free()