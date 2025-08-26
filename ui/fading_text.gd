extends Node2D

@onready var label: Label = $Text

func display_text(text: String, color: Color):
	label.text = text
	
	# Set color of text
	label.modulate = color
	
	var tween = create_tween()
	
	tween.tween_property(label, "modulate:a", 1, 1)
	tween.tween_property(label, "modulate:a", 0, 0.5)
