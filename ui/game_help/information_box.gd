extends Node2D

@onready var information_label = $InformationLabel

func _on_button_pressed() -> void:
	self.queue_free()
