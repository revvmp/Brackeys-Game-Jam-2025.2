extends "res://ui/button.gd"

var scissors_choice = false
signal scissors_button

@onready var scissors = $"../RockPaperScissorsOptions"

func on_mouse_pressed():
	if !scissors_choice:
		scissors.make_rps_choice()
		emit_signal("scissors_button")
		print("scissors")
		scissors_choice = true
