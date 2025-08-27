extends Node2D

enum Choice {
	ROCK,
	PAPER,
	SCISSORS
}

@onready var hand = $Hand

signal opponent_choice_made

func _on_ready():
	randomize()

func make_rps_choice():
	
	hand.stop()
	
	var npc_choice = randi_range(0, 2)
	
	hand.frame = npc_choice
	
	opponent_choice_made.emit(Choice.keys()[npc_choice])
