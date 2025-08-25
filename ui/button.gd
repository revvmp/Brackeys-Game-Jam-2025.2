extends Node2D

@onready var sprite = $Sprite2D

var default_color = Color(1, 1, 1) 
var hover_color = Color(1.0, 1.0, 0.8) 
var pressed_color = Color(0.6, 0.6, 0.6) # Darker

func _ready():
	sprite.modulate = default_color


func _on_area_2d_mouse_entered() -> void:
	sprite.modulate = hover_color


func _on_area_2d_mouse_exited() -> void:
	sprite.modulate = default_color


func _on_area_2d_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	# Check if the event is a mouse button press
	if event is InputEventMouseButton:
		# Check if the left mouse button was pressed
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			sprite.modulate = pressed_color
			print("button was clicked")
		# Check if the left mouse button was released
		elif event.button_index == MOUSE_BUTTON_LEFT and not event.pressed:
			sprite.modulate = hover_color
