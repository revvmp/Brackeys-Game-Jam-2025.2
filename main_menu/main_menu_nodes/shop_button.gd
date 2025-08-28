extends "res://ui/button.gd"

signal on_shop_pressed

func on_mouse_pressed():
	on_shop_pressed.emit()
