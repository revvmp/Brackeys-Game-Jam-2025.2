extends "res://ui/button.gd"

var paper_choice = false
signal paper_button

@onready var paper = $"../RockPaperScissorsOptions"

func on_mouse_pressed():
	if !paper_choice:
		paper.make_rps_choice()
		emit_signal("paper_button")
		print("paper")
		paper_choice = true
