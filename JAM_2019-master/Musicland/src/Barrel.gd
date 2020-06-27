extends "ScrollMovement.gd"

func _physics_process(delta):
	move()


func _on_EffectDammage_body_entered(body):
	if body.name == "Player":
		queue_free()
