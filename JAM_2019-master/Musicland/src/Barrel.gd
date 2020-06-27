extends "ScrollMovement.gd"

export var player = []

func _physics_process(delta):
	if (player == [1, 1, 1, 1]):
		queue_free()
	print(player)
	move()


func _on_EffectDammage_body_entered(body):
	pass
#	if body.name == "Player":
#		queue_free()
