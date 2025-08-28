extends "res://ui/button.gd"

signal paper_button

@onready var paper = $"../RockPaperScissorsOptions"

func on_mouse_pressed():
		paper.make_rps_choice()
		emit_signal("paper_button")
		print("paper")
