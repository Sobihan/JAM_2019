extends Control

export (NodePath) var button_path
onready var Fa = get_node(button_path)

func _ready():
	Fa.set_toggle_mode(false)
