extends Node2D

export var scroll_speed = 4

func move():
	self.position.x -= scroll_speed

