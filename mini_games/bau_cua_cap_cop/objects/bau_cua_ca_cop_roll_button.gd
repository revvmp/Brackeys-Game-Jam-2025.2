extends "res://ui/button.gd"

@onready var dice = $"../BauCuaCaCopDice"
@onready var money_display = $"../MoneyDisplay"

func on_mouse_pressed():
	dice.roll()
