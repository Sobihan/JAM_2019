extends Node2D

export (Array, PackedScene) var scenes

var random_scene = RandomNumberGenerator.new()
var selected_scene_index = 0


onready var timer = get_node("Timer")
var off = 3.0

func _ready():
	Signals.connect("accelerate", self, "accelerate")

func _on_Timer_timeout():
	random_scene.randomize()
	selected_scene_index = random_scene.randi_range(0, scenes.size() - 1)
	var tmp = scenes[selected_scene_index].instance()
	add_child_below_node(self, tmp)

func accelerate():
	off -= 0.5
	timer.set_wait_time(off)
