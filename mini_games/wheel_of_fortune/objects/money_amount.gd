extends Control

var value : int
@onready var amount = $Amount
@onready var button = $"../Button"
@onready var text = $"../FadingText"

func _ready() -> void:
	amount.max_value = Global.money
	amount.get_line_edit().connect("text_submitted", _on_text_submitted) 

func _on_text_submitted(new_text: String):
	amount.max_value = Global.money
	if Global.money >= int(new_text) and int(new_text) > 0:
		text.display_text("Betting " + new_text + "!!", Color.SKY_BLUE)
		button.spinning = false
		amount.get_line_edit().release_focus()
		value = int(new_text)
		print(new_text)
	else:
		text.display_text("Invalid Amount!", Color.RED)
		button.spinning = true
