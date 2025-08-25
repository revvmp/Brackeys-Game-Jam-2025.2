extends "res://ui/button.gd"

signal exit_pressed

func on_mouse_pressed():
	emit_signal("exit_pressed")
