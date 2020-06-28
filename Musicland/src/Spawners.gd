extends Node2D

export (Array, PackedScene) var scenes

var random_scene = RandomNumberGenerator.new()
var selected_scene_index = 0


onready var timer = get_node("Timer")
var off = 3.0
var isboss = false

func _ready():
# warning-ignore:return_value_discarded
	Signals.connect("accelerate", self, "accelerate")
# warning-ignore:return_value_discarded
	Signals.connect("addboss", self, "addboss")

func _on_Timer_timeout():
	random_scene.randomize()
	if isboss:
		selected_scene_index = random_scene.randi_range(0, scenes.size() - 1)
	else:
		selected_scene_index = random_scene.randi_range(0, scenes.size() - 2)
	var tmp = scenes[selected_scene_index].instance()
	add_child_below_node(self, tmp)

func accelerate():
	off -= 0.5
	timer.set_wait_time(off)

func addboss():
	isboss = true
