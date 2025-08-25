extends Node2D

var num1 = 1
var num2 = 1
@onready var dice1 = $Dice
@onready var dice2 = $Dice2

func roll():
	num1 = randi_range(1, 6)
	num2 = randi_range(1, 6)
	print(num1, num2)

func _process(delta: float) -> void:
	dice1.play(str(num1))
	dice2.play(str(num2))
