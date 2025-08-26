extends "res://ui/button.gd"

@onready var dice = $"../BauCuaCaCopDice"
@onready var fading_text = $"../FadingText"

func on_mouse_pressed():
	fading_text.display_text("Invalid Money Amount", Color.RED)
	dice.roll()
