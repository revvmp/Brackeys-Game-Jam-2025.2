extends Control

var value : int
@onready var amount = $Amount
@onready var text = $"../FadingText"
@onready var spin_button = $"../Button"

var start = "123456789"

func _ready() -> void:
	amount.connect("text_changed", _on_text_changed) 

func _on_text_changed(new_text: String):
	if new_text.is_valid_int() and new_text[0] in start and Global.money >= int(new_text) and int(new_text) > 0:
		text.display_text("Betting " + new_text + "!!", Color.SKY_BLUE)
		value = int(new_text)
		print(spin_button.pressable)
		spin_button.pressable = true
	else:
		spin_button.pressable = false
		text.display_text("Invalid Amount!", Color.RED)
