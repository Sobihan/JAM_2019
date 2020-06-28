extends TextureRect

const VELOCITY: float = -1.5

var g_texture_width: float = 0

func _ready():
	g_texture_width = texture.get_size().x * scale.x

func _process(delta :float) -> void:
