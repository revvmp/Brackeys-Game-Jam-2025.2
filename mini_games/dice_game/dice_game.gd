extends Node2D

@onready var dice = $Dice
@onready var button = $Button

func _ready():
	button.roll_dice.connect(dice.roll)
