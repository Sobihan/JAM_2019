extends "ScrollMovement.gd"

export var player = []

func _physics_process(delta):
	if (player == [1, 1, 1, 1, 2]):
		queue_free()
	move()


func _on_EffectDammage_body_entered(body):
	if body.name == "Player":
		queue_free()
	pass
