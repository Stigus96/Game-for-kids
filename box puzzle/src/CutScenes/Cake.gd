extends Area2D

onready var cake_animation = get_node("AnimationPlayer")

onready var is_bird_finished_flying = false

func _on_Cake_body_entered(body):
	if body.name == "Bird":
		cake_animation.play("Fly_Away") #Plays new animation
