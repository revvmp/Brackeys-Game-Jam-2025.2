extends "res://ui/button.gd"

@onready var dice = $".."

func on_mouse_pressed():
	dice.roll()
