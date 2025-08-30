extends "res://ui/button.gd"

signal scissors_button
var pressable = false

@onready var scissors = $"../RockPaperScissorsOptions"
@onready var fading_text = $"../FadingText"

func on_mouse_pressed():
	if pressable and Global.money > 0:
		emit_signal("scissors_button")
		print("scissors")
