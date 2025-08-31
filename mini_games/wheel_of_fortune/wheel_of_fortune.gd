extends Node2D

@onready var wheel = $Wheel
@onready var button = $Button
@onready var money = $MoneyDisplay
@onready var amount = $MoneyAmount
@onready var text = $FadingText

func _on_button_spin_wheel() -> void:
	money.subtract_money(amount.value)
	
	
func _on_wheel_lose_money() -> void:
	amount.get_child(0).editable = true
	text.display_text("You lost.", Color.RED)
	TransitionScene.transition_to_main_menu()


func _on_wheel_win_3x() -> void:
	amount.get_child(0).editable = true
	money.add_money(amount.value * 4)
	text.display_text("You 3x your money!", Color.GREEN)
	TransitionScene.transition_to_main_menu()


func _on_wheel_win_5x() -> void:
	amount.get_child(0).editable = true
	money.add_money(amount.value * 6)
	text.display_text("You 5x your money!!", Color.GREEN)
	TransitionScene.transition_to_main_menu()
	
