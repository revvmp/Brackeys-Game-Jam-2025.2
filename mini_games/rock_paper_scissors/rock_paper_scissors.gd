extends Node2D

@onready var rock_button = $Rock
@onready var paper_button = $Paper
@onready var scissors_button = $Scissors
@onready var money = $MoneyDisplay
@onready var opponent = $Rotate/RockPaperScissorsOptions
@onready var text = $FadingText
@onready var amount = $MoneyAmount
@onready var rotate = $Rotate

var player_choice: int = -1
var opponent_choice: int = -1

func _on_rock_rock_button() -> void:
	
	paper_button.visible = false
	scissors_button.visible = false
	rock_button.pressable = false
	
	opponent.hand.frame = 0

	var tween = create_tween()
	for i in range(3):
		tween.tween_property(rotate, "rotation_degrees", 45.0, 0.2)
		tween.tween_property(rotate, "rotation_degrees", 0.0, 0.2)
			
	await tween.finished
	
	paper_button.visible = true
	scissors_button.visible = true
	rock_button.pressable = true
	money.subtract_money(amount.value)
	player_choice = opponent.Choice.ROCK
	opponent.make_rps_choice()

func _on_paper_paper_button() -> void:
	rock_button.visible = false
	scissors_button.visible = false
	paper_button.pressable = false

	opponent.hand.frame = 0

	var tween = create_tween()
	for i in range(3):
		tween.tween_property(rotate, "rotation_degrees", 45.0, 0.2)
		tween.tween_property(rotate, "rotation_degrees", 0.0, 0.2)
			
	await tween.finished
	
	rock_button.visible = true
	scissors_button.visible = true
	paper_button.pressable = true
	money.subtract_money(amount.value)
	player_choice = opponent.Choice.PAPER
	opponent.make_rps_choice()

func _on_scissors_scissors_button() -> void:
	rock_button.visible = false
	paper_button.visible = false
	scissors_button.pressable = false
	
	opponent.hand.frame = 0
	
	var tween = create_tween()
	for i in range(3):
		tween.tween_property(rotate, "rotation_degrees", 45.0, 0.2)
		tween.tween_property(rotate, "rotation_degrees", 0.0, 0.2)
			
	await tween.finished

	rock_button.visible = true
	paper_button.visible = true
	scissors_button.pressable = true
	money.subtract_money(amount.value)
	player_choice = opponent.Choice.SCISSORS
	opponent.make_rps_choice()

func _on_rock_paper_scissors_options_opponent_choice_made(choice: String) -> void:
	opponent_choice = opponent.Choice[choice]  

	var result = get_winner(player_choice, opponent_choice)
	
	print("Player chose: ", opponent.Choice.keys()[player_choice])
	print("CPU chose: ", opponent.Choice.keys()[opponent_choice])
	print("Result: ", result)
	
	if result == "WIN":
		TransitionScene.transition_to_main_menu()
	elif result == "LOSE":
		TransitionScene.transition_to_main_menu()

func get_winner(player_choice: int, opponent_choice: int) -> String:
	if player_choice == opponent_choice:
		text.display_text("It's a tie!!", Color.WHITE) 
		money.add_money(amount.value)
		return "It's a tie!"
	elif (player_choice == opponent.Choice.ROCK and opponent_choice == opponent.Choice.SCISSORS) \
		or (player_choice == opponent.Choice.PAPER and opponent_choice == opponent.Choice.ROCK) \
		or (player_choice == opponent.Choice.SCISSORS and opponent_choice == opponent.Choice.PAPER):
		text.display_text("You win!", Color.SKY_BLUE)
		money.add_money(amount.value * 2)
		return "WIN"
	else:
		text.display_text("You lost!", Color.RED)
		return "LOSE"
