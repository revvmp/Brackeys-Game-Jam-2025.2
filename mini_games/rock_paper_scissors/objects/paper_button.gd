extends "res://ui/button.gd"

signal paper_button

@onready var paper = $"../RockPaperScissorsOptions"
@onready var fading_text = $"../FadingText"

func on_mouse_pressed():
		paper.make_rps_choice()
		emit_signal("paper_button")
		print("paper")
		fading_text.display_text("Invalid Money Amount", Color.RED)
