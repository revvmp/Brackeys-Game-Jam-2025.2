extends "res://ui/button.gd"

signal spin_slots

var pressable = false

func on_mouse_pressed() -> void:
	if pressable:
		emit_signal("spin_slots")
