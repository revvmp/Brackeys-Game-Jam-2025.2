extends Node2D

@onready var money_display = $MoneyDisplay

const MINIGAMES = [
	"res://mini_games/bau_cua_cap_cop/BauCuaCaCop.tscn",
	"res://mini_games/rock_paper_scissors/RockPaperScissors.tscn",
	"res://mini_games/snake_eyes/DiceGame.tscn",
	"res://mini_games/wheel_of_fortune/WheelOfFortune.tscn",
	"res://mini_games/plinko/PlinkoGame.tscn",
]

func _ready():
	if Global.money <= 0:
		Global.wipe_game()
		money_display.update_visual_money()

func _on_help_button_help_pressed() -> void:
	get_tree().change_scene_to_file("res://main_menu/help_menu/HelpMenu.tscn")

func _on_shop_button_on_shop_pressed() -> void:
	get_tree().change_scene_to_file("res://main_menu/shop_menu/ShopMenu.tscn")

func _on_play_button_on_play_pressed() -> void:
	var rand_int = randi_range(0, MINIGAMES.size()-1)
	TransitionScene.transition()
	await TransitionScene.on_transition_finished
	get_tree().change_scene_to_file(MINIGAMES[rand_int])
