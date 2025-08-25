extends Node

@onready var label = $Label

# make it so that commas are added to the money score
func format_number_with_commas(number: int) -> String:
	var number_string: String = str(number)
	var formatted_string: String = ""
	var count: int = 0
	
	for i in range(number_string.length() - 1, -1, -1):
		formatted_string = number_string[i] + formatted_string
		count += 1
		if count % 3 == 0 and i != 0:
			formatted_string = "," + formatted_string
			
	return formatted_string

func update_money(new_money: int):
	Global.money = new_money
	label.text = format_number_with_commas(new_money)
	
func add_money(amount: int):
	update_money(Global.money + amount)
	
func subtract_money(amount: int):
	update_money(Global.money - amount)
	
func multiply_money(amount: int):
	update_money(Global.money * amount)
	
func divide_money(amount: int):
	update_money(Global.money / amount)

func _ready():
	label.text = format_number_with_commas(Global.money)
