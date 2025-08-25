extends "res://ui/button.gd"

func on_mouse_pressed():
	get_tree().change_scene_to_file("res://main_menu/MainMenu.tscn")
