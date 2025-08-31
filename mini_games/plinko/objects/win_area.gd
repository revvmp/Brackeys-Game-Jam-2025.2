extends Area2D

@onready var winning_amount_label = $WinningAmount
@onready var is_winning_area: bool
@onready var winning_amount: float

signal ball_entered(winning_area: Area2D, node: RigidBody2D)

func _on_body_entered(body: Node2D) -> void:
	# This is the plinko ball
	if body is RigidBody2D:
		ball_entered.emit(self, body)
