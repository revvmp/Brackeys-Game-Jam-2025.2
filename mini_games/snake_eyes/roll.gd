extends "res://ui/button.gd"

var rolling = true
signal roll_dice


func on_mouse_pressed():
	if !rolling and Global.money > 0:
		emit_signal("roll_dice")
		print("roll")
		rolling = true


func _on_dice_snake_eyes() -> void:
	rolling = false


func _on_dice_dice_game_lost() -> void:
	rolling = false
