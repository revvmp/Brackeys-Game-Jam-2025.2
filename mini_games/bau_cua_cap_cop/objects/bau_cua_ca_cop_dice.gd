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

signal dice_roll_result(dice_type: DiceType)

func _on_ready():
	var rand_frame_start = randi_range(1, 6)
	var rand_frame_start_two = randi_range(1, 6)
	dice_one.frame = rand_frame_start
	dice_two.frame = rand_frame_start_two
	
