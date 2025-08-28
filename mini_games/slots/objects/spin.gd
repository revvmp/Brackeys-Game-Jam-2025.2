extends "res://ui/button.gd"

signal spin_slots

func on_mouse_pressed() -> void:
	emit_signal("spin_slots")
