extends RigidBody2D

@onready var money_input = $"../MoneyInput"
@onready var fading_text = $"../FadingText"
@onready var money_display = $"../MoneyDisplay"

var my_tween = create_tween().set_loops()

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
	var bet_amount = int(input)
	
	if bet_amount > Global.money:
		fading_text.display_text("You do not have enough!", Color.RED)
		return
		
	# Drop ball
	fading_text.display_text("Betting $" + input, Color.DARK_CYAN)
	money_display.subtract_money(bet_amount)
	unfreeze()
