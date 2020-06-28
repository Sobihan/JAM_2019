extends "ScrollMovement.gd"

export var player = []
export var touch = false

func _physics_process(delta):
	if (player == [4, 3, 1, 2]):
		queue_free()
	move()


func _on_Pickup_body_entered(body):
	if body.name == "Player":
		queue_free()
	pass




func _on_EffectDammage_body_entered(body):
	if body.name == "Player":
		queue_free()
	pass

