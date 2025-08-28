extends "res://ui/button.gd"

signal scissors_button

@onready var scissors = $"../RockPaperScissorsOptions"

func on_mouse_pressed():
		scissors.make_rps_choice()
		emit_signal("scissors_button")
		print("scissors")
