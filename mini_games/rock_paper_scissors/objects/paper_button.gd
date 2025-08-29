extends "res://ui/button.gd"

signal paper_button

@onready var paper = $"../RockPaperScissorsOptions"
@onready var fading_text = $"../FadingText"

func on_mouse_pressed():
		emit_signal("paper_button")
		print("paper")
