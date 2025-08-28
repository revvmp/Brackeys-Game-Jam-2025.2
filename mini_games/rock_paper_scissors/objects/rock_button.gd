extends "res://ui/button.gd"

signal rock_button

@onready var rock = $"../RockPaperScissorsOptions"
@onready var fading_text = $"../FadingText"

func on_mouse_pressed():
		rock.make_rps_choice()
		emit_signal("rock_button")
		print("rock")
		fading_text.display_text("Invalid Money Amount", Color.RED)
