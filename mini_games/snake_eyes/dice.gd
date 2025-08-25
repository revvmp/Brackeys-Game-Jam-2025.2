extends Node2D

var num1 = 1
var num2 = 1
signal snake_eyes
signal dice_game_lost

@onready var dice1 = $Dice
@onready var dice2 = $Dice2

func roll():
	num1 = randi_range(1, 6)
	num2 = randi_range(1, 6)
	dice1.play(str(num1))
	dice2.play(str(num2))
	if num1 == num2:
		emit_signal("snake_eyes")
	else:
		emit_signal("dice_game_lost")
		
	
