extends AnimatableBody2D

# Export variables allow you to easily change these values
# from the Inspector panel in the Godot editor.

# The total distance the platform will travel.
@export var distance = 100.0

# The speed at which the platform moves.
@export var speed = 50.0

# The time to wait at the end of each movement cycle.
@export var pause_time = 1.0

# The starting position of the platform.
var start_pos = Vector2.ZERO

# The target position the platform is moving towards.
var target_pos = Vector2.ZERO

# The direction of movement (1 for forward, -1 for backward).
var direction = 1

# A timer to handle the pauses at the end of each path.
var pause_timer = 0.0

func _ready():
	# Store the initial position of the platform.
	start_pos = global_position
	# Set the initial target position.
	target_pos = start_pos + Vector2(distance, 0)

func _physics_process(delta):
	# Check if we are paused.
	if pause_timer > 0:
		pause_timer -= delta
		return

	# Calculate the position change based on speed and direction.
	var move_by = Vector2(speed * direction * delta, 0)
	
	# Manually update the platform's global position.
	global_position += move_by

	# Check if we have reached our target.
	if direction == 1:
		# If moving forward, check if we've passed the target.
		if global_position.x >= target_pos.x:
			_change_direction()
	else:
		# If moving backward, check if we've passed the starting point.
		if global_position.x <= start_pos.x:
			_change_direction()

func _change_direction():
	# Flip the direction and reset the timer.
	direction *= -1
	pause_timer = pause_time
	
	# Update the target position for the next cycle.
	if direction == 1:
		target_pos = start_pos + Vector2(distance, 0)
	else:
		target_pos = start_pos
