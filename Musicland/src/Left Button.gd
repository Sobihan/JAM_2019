extends Control

export (NodePath) var button_path
onready var Mi = get_node(button_path)

func _ready():
	Mi.set_toggle_mode(false)
