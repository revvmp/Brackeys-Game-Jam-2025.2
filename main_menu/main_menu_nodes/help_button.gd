extends "res://ui/button.gd"

signal help_pressed

func on_mouse_pressed():
	emit_signal("help_pressed")
