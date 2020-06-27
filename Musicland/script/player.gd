extends KinematicBody2D

var velocity = Vector2.ZERO

export var jump_velocity = 1500.0
export var gravity_scale = 20.0

var can_jump: bool = true

onready var animation = $AnimatedSprite

func _ready():
	animation.play("Run")

func _physics_process(delta):
	velocity.y += gravity_scale	
	move_and_collide(velocity*delta)
		
func _input(event):
	velocity = Vector2.ZERO
	if event.is_action_pressed("jump"):
		velocity.y-=jump_velocity
		animation.play("jump")

func _on_Area2D_body_entered(body):
	if body is StaticBody2D:
		print("Floor detected")
	animation.play("run")

func _on_Area2D_body_exited(body):
	if body is StaticBody2D:
		print("Left")
	can_jump = false
