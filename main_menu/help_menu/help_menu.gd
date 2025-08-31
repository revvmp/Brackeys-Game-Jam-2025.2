extends Node2D


func _on_exit_button_exit_pressed() -> void:
	TransitionScene.transition()
	await TransitionScene.on_transition_finished
	get_tree().change_scene_to_file("res://main_menu/MainMenu.tscn")
