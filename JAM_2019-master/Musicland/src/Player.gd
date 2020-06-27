extends KinematicBody2D


var velocity = Vector2.ZERO
export var jump_velocity = 500.0
export var gravity_scale = 20.0

#var can_jump = true
enum {
	JUMP,
	RUN,
	IDLE	
}

var state = RUN

onready var animation = $PlayerAnimatedSprite


func _ready():
	get_viewport().audio_listener_enable_2d = true
	
func _physics_process(delta):
	match state:
		RUN:
			animation.play("run")
		JUMP:
			velocity = Vector2.ZERO
			velocity.y -= jump_velocity
			animation.play("jump")
			state = IDLE
		IDLE:
			pass
	velocity.y += gravity_scale
	move_and_collide(velocity * delta)
	

func playSound(path):
	var player = AudioStreamPlayer.new()
	self.add_child(player)
	player.stream = load(path)
	player.play()


func _input(event):
	if event.is_action_pressed("Jump") and state == RUN:
		state = JUMP
	elif event.is_action_pressed("ui_up"):
		$do.play()
	elif event.is_action_pressed("ui_down"):
		$re.play()
	elif event.is_action_pressed("ui_left"):
		$mi.play()
	elif event.is_action_pressed("ui_right"):
		$fa.play()

func _on_Area2D_body_entered(body):
	if body is StaticBody2D:
		state = RUN

func _on_Area2D_body_exited(body):
	if body is StaticBody2D:
		state = JUMP
