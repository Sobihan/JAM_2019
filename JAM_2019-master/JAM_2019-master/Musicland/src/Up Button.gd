extends Control

export (NodePath) var button_path
onready var Do = get_node(button_path)

func _ready():
	Do.set_toggle_mode(false)
