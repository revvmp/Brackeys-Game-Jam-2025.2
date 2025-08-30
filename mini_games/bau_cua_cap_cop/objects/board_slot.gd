extends Node2D

@export var slot_type: String
@onready var amount = $MoneyAmount
var start = "123456789"
var value: int

func _on_money_amount_text_changed(new_text: String) -> void:
	if new_text == "0":
		print("valid")
		value = 0
	elif (new_text.is_valid_int() and new_text[0] in start and Global.money >= int(new_text)):
		print("valid")
		value = int(new_text)
	else:
		print("Invalid")
		value = 0

func get_value():
	return value
