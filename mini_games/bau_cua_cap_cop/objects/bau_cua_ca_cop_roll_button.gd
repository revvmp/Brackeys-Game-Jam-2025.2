extends "res://ui/button.gd"

@onready var dice = $"../BauCuaCaCopDice"

func on_mouse_pressed():
	dice.roll()
