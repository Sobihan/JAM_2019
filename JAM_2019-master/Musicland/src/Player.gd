extends KinematicBody2D


var velocity = Vector2.ZERO
export var jump_velocity = 500.0
export var gravity_scale = 20.0

onready var timer = get_node("Timer")
onready var res = get_node("resettab")

enum {
	JUMP,
	RUN,
	IDLE	
}

var state = RUN


onready var animation = $PlayerAnimatedSprite

onready var tab = preload("res://Bone.tscn").duplicate()
onready var barril = preload("res://Barrel.tscn").duplicate()

func _ready():
	get_viewport().audio_listener_enable_2d = true
	timer.set_wait_time(0.1)
	res.set_wait_time(2)
	res.start()
	timer.start()

var key = true
var toClean = false
	
func _physics_process(delta):
	var arr = tab.instance()
	var b = barril.instance()
	match state:
		RUN:
			animation.play("run")
			if toClean:
				toClean = false
				b.player.clear()
				arr.player.clear()
			if (arr.player.size() > 4):
				arr.player.pop_front()
			if (b.player.size() > 4):
				b.player.pop_front()
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
	var arr = tab.instance()
	var b = barril.instance()
	if event.is_action_pressed("Jump") and state == RUN:
		state = JUMP
	elif event.is_action_pressed("ui_up") and key:
		arr.player.push_back(1)
		b.player.push_back(1)
		key = false
		timer.start()
		$do.play()
	elif event.is_action_pressed("ui_down") and key:
		arr.player.push_back(2)
		b.player.push_back(2)
		key = false
		timer.start()
		$re.play()
	elif event.is_action_pressed("ui_left") and key:
		arr.player.push_back(3)
		b.player.push_back(3)
		key = false
		timer.start()
		$mi.play()
	elif event.is_action_pressed("ui_right") and key:
		arr.player.push_back(4)
		b.player.push_back(4)
		key = false
		timer.start()
		$fa.play()

func _on_Area2D_body_entered(body):
	if body is StaticBody2D:
		state = RUN

func _on_Area2D_body_exited(body):
	if body is StaticBody2D:
		state = JUMP


func _on_Timer_timeout():
	key = true


func _on_resettab_timeout():
	toClean = true
