extends Node2D

# These are ordered in their animation sprite frame
enum DiceType {
	CHICKEN,
	CRAB,
	DEER,
	FISH,
	GOURD,
	SHRIMP
}

@onready var dice_one = $DiceOne
@onready var dice_two = $DiceTwo
@onready var dice_three = $DiceThree

signal dice_roll_result(dice_one_type: DiceType, 
						dice_two_type: DiceType,
						dice_two_three: DiceType)

func _on_ready():
	randomize()

func roll():
	
	dice_one.stop()
	dice_two.stop()
	dice_three.stop()
	
	var rand_result = randi_range(0, 5)
	var rand_result_two = randi_range(0, 5)
	var rand_result_three = randi_range(0, 5)
	
	dice_one.frame = rand_result
	dice_two.frame = rand_result_two
	dice_three.frame = rand_result_three
	
	dice_roll_result.emit(DiceType.keys()[rand_result],
						DiceType.keys()[rand_result_two],
						DiceType.keys()[rand_result_three])
	
