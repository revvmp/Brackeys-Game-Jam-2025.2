extends "res://ui/button.gd"

var spinning = true
signal spin_wheel

@onready var amount = $"../MoneyAmount"

func on_mouse_pressed():
	if !spinning and Global.money > 0 and amount.value <= Global.money:
		emit_signal("spin_wheel")
		spinning = true


func _on_wheel_lose_money() -> void:
	spinning = false


func _on_wheel_win_money() -> void:
	spinning = false
