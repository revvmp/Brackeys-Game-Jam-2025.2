extends "res://ui/button.gd"

var rock_choice = false
signal rock_button

@onready var rock = $"../RockPaperScissorsOptions"

func on_mouse_pressed():
	if !rock_choice:
		rock.make_rps_choice()
		emit_signal("rock_button")
		print("rock")
		rock_choice = true
