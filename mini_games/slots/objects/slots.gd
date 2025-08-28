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
	print(results_list)
	
	if len(results_list) != 3:
		return

	for i in range(3):
		var num = results_list[i]
		if str(num) in results:
			results[str(num)] += 1
		else:
			results[str(num)] = 1
			
	var values = results.values()
	
	var added_money = false
	
	for val in values:
		if val == 2:
			added_money = true
			money.add_money(2 * bet)
		elif val == 3:
			added_money = true
			money.add_money(30 * bet)

	if not added_money:
		money.subtract_money(10)
			
	print(values)
