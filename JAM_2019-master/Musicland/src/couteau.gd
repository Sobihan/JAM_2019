extends "ScrollMovement.gd"

export var player = []

func _physics_process(delta):
	if (player == [3, 1, 1, 1]):
		queue_free()
	move()


#if body.name == "Player":
#		get_tree().quit()



func _on_EffectDammage_body_entered(body):
	if body.name == "Player":
		get_tree().quit()
