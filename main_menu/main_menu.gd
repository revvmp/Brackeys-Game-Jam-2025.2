extends Node2D


func _on_help_button_help_pressed() -> void:
	get_tree().change_scene_to_file("res://main_menu/help_menu/HelpMenu.tscn")
