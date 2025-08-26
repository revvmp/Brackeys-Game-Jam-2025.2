extends Node2D

var num1 = 1
var num2 = 1
var animation_num1 = 1
var animation_num2 = 1
var time = 0.1


signal snake_eyes
signal dice_game_lost

@onready var dice1 = $Dice
@onready var dice2 = $Dice2
@onready var text = $"../FadingText"


func _ready() -> void:
	randomize()
	
func roll():
	for i in range (25):
		await get_tree().create_timer(time).timeout
		animation_num1 = randi_range(1, 6)
		animation_num2 = randi_range(1, 6)
		dice1.play(str(animation_num1))
		dice2.play(str(animation_num2))
		if i > 20:
			time += 0.5
		else:
			time += 0.01
	
	num1 = randi_range(1, 6)
	num2 = randi_range(1, 6)
	dice1.play(str(num1))
	dice2.play(str(num2))
	time = 0.1
	print("roll complete")
	if num1 == num2:
		emit_signal("snake_eyes")
		text.display_text("Snake Eyes!", Color.SKY_BLUE)
	else:
		emit_signal("dice_game_lost")
		text.display_text("Game Lost.", Color.RED)
