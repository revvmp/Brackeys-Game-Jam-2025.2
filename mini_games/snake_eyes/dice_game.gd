extends Node2D

@onready var dice = $Dice
@onready var button = $Button
@onready var money = $MoneyDisplay

func _on_button_roll_dice() -> void:
	dice.roll()

func _on_dice_snake_eyes() -> void:
	money.multiply_money(10)
	

func _on_dice_dice_game_lost() -> void:
	money.divide_money(2)
