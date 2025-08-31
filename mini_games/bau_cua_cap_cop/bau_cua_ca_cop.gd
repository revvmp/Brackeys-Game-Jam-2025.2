extends Node2D

@onready var board = $Board
@onready var button = $RollButton
@onready var money = $MoneyDisplay
@onready var text = $FadingText
@onready var all_text = $AllFadingText

func _on_bau_cua_ca_cop_dice_dice_roll_result(dice_one_type: String, 
											dice_two_type: String,
											dice_three_type: String) -> void:
	# Update Money Heres
	print("Dice One: " + str(dice_one_type) + 
			" | Dice Two: " + str(dice_two_type) +
			" | Dice Three: " + str(dice_three_type))

	var bets = []
	for key in button.amounts.keys():
		var value = button.amounts[key]
		if value > 0:
			bets.append(key)
			print(key + " has a bet of " + str(value))
	print(bets)
	
	var dice_result = [dice_one_type, dice_two_type, dice_three_type]
	var amount_won = 0
	
	for type in bets:
		var count = dice_result.count(type)
		var pay = 0
		if count > 0:
			pay = button.amounts[type] * (count + 1)
			money.add_money(pay)
			amount_won += pay
		
		var result = all_text.get_node(type)
		if pay > 0:
			result.display_text("+" + str(pay), Color.GREEN)
		else:
			result.display_text("-" + str(button.amounts[type]), Color.RED)
	
	text.display_text("You bet $" + str(button.total) + " and won $" + str(amount_won), Color.GREEN)
	TransitionScene.transition_to_main_menu()
		
