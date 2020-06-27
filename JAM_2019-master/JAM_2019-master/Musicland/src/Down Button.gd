extends Control

export (NodePath) var button_path
onready var Re = get_node(button_path)

func _ready():
	Re.set_toggle_mode(false)
