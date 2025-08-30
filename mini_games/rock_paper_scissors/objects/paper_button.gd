extends "res://ui/button.gd"

signal paper_button
var pressable = false

@onready var paper = $"../RockPaperScissorsOptions"
@onready var fading_text = $"../FadingText"

func on_mouse_pressed():
		if pressable:
			emit_signal("paper_button")
			print("paper")
