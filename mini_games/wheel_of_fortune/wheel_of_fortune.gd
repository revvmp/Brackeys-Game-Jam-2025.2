extends Node2D

@onready var wheel = $Wheel
@onready var button = $Button
@onready var money = $MoneyDisplay
@onready var amount = $MoneyAmount
@onready var text = $FadingText

func _on_button_spin_wheel() -> void:
	money.subtract_money(amount.value)


func _on_wheel_win_money() -> void:
	money.add_money(amount.value * 2)
	Global.save_global_data()
	text.display_text("You doubled your money!", Color.SKY_BLUE)
	
	
func _on_wheel_lose_money() -> void:
	Global.save_global_data()
	text.display_text("You lost.", Color.RED)
