extends Node2D

@onready var rock_button = $Rock
@onready var paper_button = $Paper
@onready var scissors_button = $Scissors
@onready var money = $MoneyDisplay
@onready var opponent = $RockPaperScissorsOptions
@onready var text = $FadingText

var player_choice: int = -1
var opponent_choice: int = -1

func _on_rock_rock_button() -> void:
	player_choice = opponent.Choice.ROCK
	opponent.make_rps_choice()

func _on_paper_paper_button() -> void:
	player_choice = opponent.Choice.PAPER
	opponent.make_rps_choice()

func _on_scissors_scissors_button() -> void:
	player_choice = opponent.Choice.SCISSORS
	opponent.make_rps_choice()

func _on_rock_paper_scissors_options_opponent_choice_made(choice: String) -> void:
	opponent_choice = opponent.Choice[choice]  

	var result = get_winner(player_choice, opponent_choice)
	
	print("Player chose: ", opponent.Choice.keys()[player_choice])
	print("CPU chose: ", opponent.Choice.keys()[opponent_choice])
	print("Result: ", result)

func get_winner(player_choice: int, opponent_choice: int) -> String:

	if player_choice == opponent_choice:
		text.display_text("It's a tie!!", Color.WHITE)
		return "It's a tie!"

	elif (player_choice == opponent.Choice.ROCK and opponent_choice == opponent.Choice.SCISSORS) \
		or (player_choice == opponent.Choice.PAPER and opponent_choice == opponent.Choice.ROCK) \
		or (player_choice == opponent.Choice.SCISSORS and opponent_choice == opponent.Choice.PAPER):
		text.display_text("You win!", Color.SKY_BLUE)
		return "Player wins!"

		
	else:
		text.display_text("You lost!", Color.RED)
		return "CPU wins!"

func update_money(result: String) -> void:
	if result == "Result: Player wins!":
		money.add_money(10)
		text.display_text("You win!", Color.SKY_BLUE)
	elif result == "Result: CPU wins!":
		money.subtract_money(5)
		text.display_text("You lost!", Color.RED)
