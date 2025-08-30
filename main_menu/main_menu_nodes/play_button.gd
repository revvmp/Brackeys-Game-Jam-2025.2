extends "res://ui/button.gd"

signal on_play_pressed

func on_mouse_pressed():
	on_play_pressed.emit()
