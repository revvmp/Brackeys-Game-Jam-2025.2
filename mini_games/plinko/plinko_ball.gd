extends RigidBody2D

@onready var money_input = $"../MoneyInput"
@onready var fading_text = $"../FadingText"
@onready var money_display = $"../MoneyDisplay"
@onready var soft_lock_timer = $SoftLockTimer

var my_tween = create_tween().set_loops()
var bet_amount: int = 0

var last_position: Vector2

func is_numeric(text: String) -> bool:
	# Attempt to convert to float (handles both integers and decimals)
	var num_val = text.to_float()

	# Check if the conversion resulted in a valid number (not NaN or infinity)
	# is_nan() and is_inf() are useful here
	if not is_nan(num_val) and not is_inf(num_val):
		return true
	if text.strip_edges().is_empty():
		return false
	return false


func _ready() -> void:
	my_tween.tween_property(self, "position", Vector2(1000, self.position.y), 2.0)
	my_tween.tween_property(self, "position", Vector2(280, self.position.y), 2.0)
	
	soft_lock_timer.connect("timeout", _on_reset_timer_timeout)

func _physics_process(delta: float) -> void:
	if global_position.distance_to(last_position) > 0.01:
		# If it's moving, stop and reset the timer.
		soft_lock_timer.stop()
		# Update the last position.
		last_position = global_position
	else:
		if not soft_lock_timer.is_stopped():
			soft_lock_timer.start()
	
func _on_reset_timer_timeout():
	print("SOFT LOCKED DETECTED")
	TransitionScene.transition()
	await TransitionScene.on_transition_finished
	get_tree().change_scene_to_file("res://mini_games/plinko/PlinkoGame.tscn")

func unfreeze():
	if my_tween and my_tween.is_running():
		my_tween.kill()
	self.set("freeze", false)


func _on_drop_button_pressed() -> void:
	# Ball has already been dropped.
	if not self.get("freeze"):
		return
	# Check if the money entered is valid
	var input = money_input.text
	if not is_numeric(input) or not input:
		fading_text.display_text("Invalid money amount!", Color.RED)
		return
	var bet = int(input)
	
	if bet > Global.money:
		fading_text.display_text("You do not have enough!", Color.RED)
		return
		
	# Drop ball
	fading_text.display_text("Betting $" + input, Color.DARK_CYAN)
	money_display.subtract_money(bet)
	bet_amount = bet
	unfreeze()
