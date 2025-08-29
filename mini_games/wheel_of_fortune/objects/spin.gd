extends "res://ui/button.gd"

var spinning = true
signal spin_wheel

func on_mouse_pressed():
	if !spinning:
		emit_signal("spin_wheel")
		spinning = true


func _on_wheel_lose_money() -> void:
	spinning = false


func _on_wheel_win_money() -> void:
	spinning = false
