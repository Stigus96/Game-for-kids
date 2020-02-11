extends Area2D

func _ready():
    connect("body_enter", self, "_on_enemy_body_enter")


func _on_enemy_body_enter(body):
    print("Collision")
    if (body.get_name() == "Player"):
        print("Ouch!")
