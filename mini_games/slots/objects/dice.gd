extends Node2D

var num1 = 1
var num2 = 1
var num3 = 1

var animation_num1 = 1
var animation_num2 = 1
var animation_num3 = 1

var time = 0.1

signal spin_result

@onready var dice1 = $Dice
@onready var dice2 = $Dice2
@onready var dice3 = $Dice3

func roll():
	for i in range (15):
		await get_tree().create_timer(time).timeout
		animation_num1 = randi_range(1, 6)
		animation_num2 = randi_range(1, 6)
		animation_num3 = randi_range(1, 6)

		dice1.play(str(animation_num1))
		dice2.play(str(animation_num2))
		dice3.play(str(animation_num3))

		if i > 20:
			time += 0.5
		else:
			time += 0.01
	
	num1 = randi_range(1, 6)
	num2 = randi_range(1, 6)
	num3 = randi_range(1, 6)
	
	dice1.play(str(num1))
	dice2.play(str(num2))
	dice3.play(str(num3))
	
	time = 0.1
	
	print("spin complete")
	var results_list = [num1, num2, num3]
	emit_signal("spin_result", results_list)
