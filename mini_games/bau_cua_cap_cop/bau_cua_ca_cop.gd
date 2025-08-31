extends Node2D

@onready var board = $Board
@onready var button = $RollButton
@onready var money = $MoneyDisplay
@onready var text = $FadingText

func _on_bau_cua_ca_cop_dice_dice_roll_result(dice_one_type: String, 
											dice_two_type: String,
											dice_three_type: String) -> void:
	# Update Money Heres
	print("Dice One: " + str(dice_one_type) + 
			" | Dice Two: " + str(dice_two_type) +
			" | Dice Three: " + str(dice_three_type))

	var bets: String
	for key in button.amounts.keys():
		var value = button.amounts[key]
		if value > 0:
			bets += key
			print(key + " has a bet of " + str(value))
	print(bets)
	
	var amount_won: int
	if dice_one_type in bets:
		money.add_money(button.amounts[dice_one_type] * 2)
		amount_won += button.amounts[dice_one_type] * 2
	if dice_two_type in bets:
		money.add_money(button.amounts[dice_two_type] * 2)
		amount_won += button.amounts[dice_two_type] * 2
	if dice_three_type in bets:
		money.add_money(button.amounts[dice_three_type] * 2)
		amount_won += button.amounts[dice_three_type] * 2
	text.display_text("You bet $" + str(button.total) + " and won $" + str(amount_won), Color.GREEN)
		
