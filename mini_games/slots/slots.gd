extends Node2D

@onready var slots = $Items
@onready var money = $MoneyDisplay
@onready var text = $FadingText
@onready var sm = $Slot/SlotMachine
@onready var sm2 = $Slot/SlotMachine2
@onready var amount = $MoneyAmount/Amount
@onready var button = $Button

func _on_spin_cilcked() -> void:
	amount.editable = false
	sm2.show()
	sm.hide()
	button.hide()
	await slots.spin()
	sm2.hide()
	sm.show()
	await get_tree().create_timer(0.6).timeout
	TransitionScene.transition_to_main_menu()

func _on_items_spin_result(results_list, bet) -> void:
	var results = {}
	var multi_map = {
		1: 1,
		2: 1,
		3: 1,
		4: 1.5,
		5: 2,
		6: 3
	}
	
	"""
	1: Cherry
	2: Grape
	3: Orange
	4: 7
	5: Bar
	6: Diamond
	"""
	
	if len(results_list) != 3:
		return

	for i in range(3):
		var num = results_list[i]
		if str(num) in results:
			results[str(num)] += 1
		else:
			results[str(num)] = 1
			

	var keys = results.keys()
	var added_money = false
	var message = ''
	
	var money_amount = 0
	
	for key in keys:
		var value = results[key]
		print(keys)

		var multi = multi_map[int(key)]
		
		if not multi:
			multi = 1
			
		if value == 2:
			added_money = true
			money_amount = 2 * bet * multi
			message = "+ $" + str(int(money_amount))
			money.add_money(money_amount)
		elif value == 3:
			added_money = true
			money_amount = 20 * bet * multi
			message = "+ $" + str(int(money_amount))
			money.add_money(money_amount)
			

	if not added_money:
		if 1 in keys and 2 in keys and 3 in keys:
			#All fruits
			money_amount = 5 * bet
			message = "+ $" + str(int(money_amount))
			money.add_money(money_amount)
		else:
			money_amount = -bet
			message = "- $" + str(bet)
			money.subtract_money(bet)
		
	if money_amount > 0:
		text.display_text(message, Color.GREEN)
	else:
		text.display_text(message, Color.RED)
