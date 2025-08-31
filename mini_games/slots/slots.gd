extends Node2D

@onready var slots = $Items
@onready var button = $Button
@onready var money = $MoneyDisplay

#Add changable bet later
const bet = 10

func _on_spin_cilcked() -> void:
	button.hide()
	await slots.spin()
	button.show()


func _on_items_spin_result(results_list) -> void:
	var results = {}
	
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
	
	
	for key in keys:
		var value = results[key]
		var multi = 0.5 * int(key)
		if value == 2:
			added_money = true
			var money_amount = 2 * bet * multi
			print("+ $" + str(money_amount))
			money.add_money(money_amount)
		elif value == 3:
			added_money = true
			var money_amount = 20 * bet * multi
			print("+ $" + str(money_amount))
			money.add_money(money_amount)

	if not added_money:
		money.subtract_money(10)
