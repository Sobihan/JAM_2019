extends "ScrollMovement.gd"

export var player = []
export var touch = false
func _physics_process(delta):
	if (player == [1, 1, 2, 2]):
		queue_free()
	move()


func _on_Pickup_body_entered(body):
	if body.name == "Player":
		queue_free()
	pass
