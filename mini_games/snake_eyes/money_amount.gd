extends Control

var value : int
@onready var amount = $Amount
@onready var button = $"../Button"
@onready var text = $"../FadingText"
var start = "123456789"

func _on_amount_text_changed(new_text: String) -> void:
	if new_text.is_valid_int() and new_text[0] in start and Global.money >= int(new_text) and int(new_text) > 0:
		text.display_text("Betting " + new_text + "!!", Color.SKY_BLUE)
		button.rolling = false
		value = int(new_text)
		print(new_text)
	else:
		text.display_text("Invalid Amount!", Color.RED)
		button.rolling = true
		
