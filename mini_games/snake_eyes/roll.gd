extends "res://ui/button.gd"

signal roll_dice

func on_mouse_pressed():
	emit_signal("roll_dice")
	print("roll")
