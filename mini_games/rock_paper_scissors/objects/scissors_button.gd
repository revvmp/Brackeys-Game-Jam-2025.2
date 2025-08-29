extends "res://ui/button.gd"

signal scissors_button

@onready var scissors = $"../RockPaperScissorsOptions"
@onready var fading_text = $"../FadingText"

func on_mouse_pressed():
		emit_signal("scissors_button")
		print("scissors")
