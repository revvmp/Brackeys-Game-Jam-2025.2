extends Area2D

@onready var item = $".."

var default_color = Color(1, 1, 1) 
var hover_color = Color(1.0, 1.0, 0.8) 
var pressed_color = Color(0.6, 0.6, 0.6) # Darker

func _ready():
	item.modulate = default_color

func _on_area_2d_mouse_entered() -> void:
	item.modulate = hover_color
	print("entered")

func _on_area_2d_mouse_exited() -> void:
	item.modulate = default_color

func _on_area_2d_input_event(_viewport: Node, event: InputEvent, _shape_idx: int) -> void:
	# Check if the event is a mouse button press
	if event is InputEventMouseButton:
		# Check if the left mouse button was pressed
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			item.modulate = pressed_color
			print("")
		# Check if the left mouse button was released
		elif event.button_index == MOUSE_BUTTON_LEFT and not event.pressed:
			item.modulate = hover_color
			on_mouse_pressed()
			
func on_mouse_pressed():
	print("pressed")
