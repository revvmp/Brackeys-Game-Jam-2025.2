extends Node2D

const BUYABLE_SCENE = preload("res://main_menu/shop_menu/Buyable.tscn")
@onready var items_container = $ShopItems/VBoxContainer
@onready var fading_text = $FadingText

func _ready() -> void:
	load_shop()
	
func load_shop() -> void:
	# Clear any existing items in the container
	for child in items_container.get_children():
		child.queue_free()

	# Loop through our list of item data
	for trophy: Global.Trophy in Global.shop:
		var buyable_instance = BUYABLE_SCENE.instantiate()

		items_container.add_child(buyable_instance)
		
		buyable_instance.set_trohy_info(trophy)

func _on_exit_button_exit_pressed() -> void:
	get_tree().change_scene_to_file("res://main_menu/MainMenu.tscn")
