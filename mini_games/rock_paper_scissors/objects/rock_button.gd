extends "res://ui/button.gd"

signal rock_button

@onready var rock = $"../RockPaperScissorsOptions"
@onready var fading_text = $"../FadingText"

func on_mouse_pressed():
		emit_signal("rock_button")
		print("rock")
