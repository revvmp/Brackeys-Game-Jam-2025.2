extends "res://ui/button.gd"

@onready var dice = $"../BauCuaCaCopDice"
@onready var fading_text = $"../FadingText"
@onready var board = $"../Board"
@onready var money = $"../MoneyDisplay"

var amounts = {}
var total: int
	
func on_mouse_pressed():
	amounts = board.get_all_values()
	for value in amounts.values():
		total += value
	print(total)
	if Global.money > 0 and Global.money >= total and total > 0:
		money.subtract_money(total)
		#fading_text.display_text("You bet " + str(total) + " ", Color.SKY_BLUE)
		dice.roll()
	else:
		fading_text.display_text("You do not have enough money", Color.RED)
	total = 0
