extends Node2D


func _on_bau_cua_ca_cop_dice_dice_roll_result(dice_one_type: String, 
											dice_two_type: String,
											dice_three_type: String) -> void:
	# Update Money Heres
	print("Dice One: " + str(dice_one_type) + 
			" | Dice Two: " + str(dice_two_type) +
			" | Dice Three: " + str(dice_three_type))
