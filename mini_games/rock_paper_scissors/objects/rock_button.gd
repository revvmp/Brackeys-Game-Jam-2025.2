extends "res://ui/button.gd"

signal rock_button
var pressable = false

@onready var rock = $"../RockPaperScissorsOptions"
@onready var fading_text = $"../FadingText"

func on_mouse_pressed(): 
	if pressable and Global.money > 0:
		emit_signal("rock_button")
		print("rock")
