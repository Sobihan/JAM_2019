extends "ScrollMovement.gd"

export var player = []
export var touch = false

func _physics_process(delta):
	if (player == [4, 1, 1, 1]):
		queue_free()
	move()


func _on_Pickup_body_entered(body):
	if body.name == "Player":
		get_tree().quit()
		queue_free()




func _on_EffectDammage_body_entered(body):
	if body.name == "Player":
		get_tree().quit()
