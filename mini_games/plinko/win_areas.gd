extends Node2D

# See children of this node for win area structure
var win_areas: Array[Area2D] = []

func _ready() -> void:
	randomize()
	for node in get_children():
		win_areas.append(node)
		node.connect("ball_entered", Callable(self, "_on_ball_fall"))
	randomize_winnings()

# Randomise all the possible winnings
func randomize_winnings():
	# All possible losing
	# 0 = lose all of your money
	# 1 = lose half of your money
	for area in win_areas:
		# 50% of an area being a losing one
		var is_losing_area = randi_range(0, 1) == 0
		var possible_lose = randi_range(0, 1)
		var possible_win = randi_range(2, 3)
		if is_losing_area:
			# Label
			if possible_lose == 1:
				area.winning_amount_label.text = "0.5x"
				area.winning_amount = 0.5
			else:
				area.winning_amount_label.text = str(possible_lose) + "x"
				area.winning_amount = 0
				
			area.winning_amount_label.set("modulate", Color.RED)
			continue
		# Is winning
		area.winning_amount_label.text = str(possible_win) + "x"
		area.winning_amount_label.set("modulate", Color.GREEN)
		area.winning_amount = possible_win
		
func _on_ball_fall(winning_area: Node2D, ball: RigidBody2D):
	print(ball)
