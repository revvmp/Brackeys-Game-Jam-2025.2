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
	money.add_money(amount.value * 10)
	Global.save_global_data()
	text.display_text("Snake Eyes!", Color.SKY_BLUE)

func _on_dice_dice_game_lost() -> void:
	Global.save_global_data()
	text.display_text("Game Lost.", Color.RED)
