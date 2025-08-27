extends "res://ui/button.gd"

var spinning = true
signal spin_wheel

func on_mouse_pressed():
	if !spinning:
		emit_signal("spin_wheel")
		print("spin")
		spinning = true
