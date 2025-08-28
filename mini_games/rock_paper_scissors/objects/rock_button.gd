extends "res://ui/button.gd"

signal rock_button

@onready var rock = $"../RockPaperScissorsOptions"

func on_mouse_pressed():
		rock.make_rps_choice()
		emit_signal("rock_button")
		print("rock")
