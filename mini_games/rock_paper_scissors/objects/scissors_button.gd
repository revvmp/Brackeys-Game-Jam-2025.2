extends "res://ui/button.gd"

signal scissors_button

@onready var scissors = $"../RockPaperScissorsOptions"
@onready var fading_text = $"../FadingText"

func on_mouse_pressed():
		scissors.make_rps_choice()
		emit_signal("scissors_button")
		print("scissors")
		fading_text.display_text("Invalid Money Amount", Color.RED)
