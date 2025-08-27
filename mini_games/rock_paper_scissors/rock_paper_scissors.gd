extends Node2D

@onready var rock_button = $Rock
@onready var paper_button = $Paper
@onready var scissors_button = $Scissors
@onready var money = $MoneyDisplay
@onready var opponent = $RockPaperScissorsOptions

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

func _on_opponent_choice(choice: String):
	opponent_choice = opponent.Choice[choice]  

	var result = get_winner(player_choice, opponent_choice)
	print("Player chose: ", opponent.Choice.keys()[player_choice])
	print("CPU chose: ", opponent.Choice.keys()[opponent_choice])
	print("Result: ", result)

func get_winner(player, cpu):
	if player == cpu:
		return "It's a tie!"

	elif (player == opponent.Choice.ROCK and cpu == opponent.Choice.SCISSORS) \
		or (player == opponent.Choice.PAPER and cpu == opponent.Choice.ROCK) \
		or (player == opponent.Choice.SCISSORS and cpu == opponent.Choice.PAPER):
		return "Player wins!"
	else:
		return "CPU wins!"
		
func update_money(player, cpu) -> void:
	if (player == opponent.Choice.ROCK and cpu == opponent.Choice.SCISSORS) \
		or (player == opponent.Choice.PAPER and cpu == opponent.Choice.ROCK) \
		or (player == opponent.Choice.SCISSORS and cpu == opponent.Choice.PAPER):
		money.add_money(10)
