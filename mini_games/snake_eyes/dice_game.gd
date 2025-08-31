extends Node2D

@onready var dice = $Dice
@onready var button = $Button
@onready var money = $MoneyDisplay
@onready var amount = $MoneyAmount
@onready var text = $FadingText

func _on_button_roll_dice() -> void:
		dice.roll()
		money.subtract_money(amount.value)

func _on_dice_snake_eyes() -> void:
	amount.get_child(0).editable = true
	money.add_money(amount.value * 7)
	text.display_text("You got a match and 6x your money!", Color.SKY_BLUE)

func _on_dice_dice_game_lost() -> void:
	amount.get_child(0).editable = true
	text.display_text("Game Lost.", Color.RED)
