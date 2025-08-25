extends Node2D

@onready var dice = $Dice
@onready var button = $Button

func _on_button_roll_dice() -> void:
	dice.roll()
