extends "res://ui/button.gd"

func _on_area_2d_input_event(_viewport: Node, event: InputEvent, _shape_idx: int) -> void:
	super(_viewport, event, _shape_idx)
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and not event.pressed:
			print("Open Help Menu")
