extends Node2D

@onready var wheel = $Wheel
@onready var button = $Button
@onready var money = $MoneyDisplay
@onready var amount = $MoneyAmount

func _on_button_spin_wheel() -> void:
	money.subtract_money(amount.value)
