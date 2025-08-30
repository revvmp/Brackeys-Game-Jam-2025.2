extends Node2D

@export var help_information: String

func _ready() -> void:
	print("GAME HELP")


func _on_texture_button_pressed() -> void:
	print("Game Information Button Pressed")
