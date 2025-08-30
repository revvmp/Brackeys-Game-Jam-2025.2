extends Control

var value : int
@onready var amount = $Amount
@onready var rock = $"../Rock"
@onready var paper = $"../Paper"
@onready var scissors = $"../Scissors"
@onready var text = $"../FadingText"

var start = "123456789"

func _ready() -> void:
	amount.max_value = Global.money
	amount.get_line_edit().connect("text_changed", _on_text_changed) 

func _on_text_changed(new_text: String):
	amount.max_value = Global.money
	if new_text.is_valid_int() and new_text[0] in start and Global.money >= int(new_text) and int(new_text) > 0:
		text.display_text("Betting " + new_text + "!!", Color.SKY_BLUE)
		rock.pressable = true
		paper.pressable = true
		scissors.pressable = true 
		value = int(new_text)
		print(new_text)
	else:
		text.display_text("Invalid Amount!", Color.RED)
		rock.pressable = false
		paper.pressable = false
		scissors.pressable = false
