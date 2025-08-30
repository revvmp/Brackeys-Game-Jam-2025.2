extends Node2D

const BUYABLE_SCENE = preload("res://main_menu/shop_menu/Buyable.tscn")
@onready var items_container = $ShopItems/VBoxContainer
@onready var inventory_container = $Inventory/VBoxContainer
@onready var fading_text = $FadingText
@onready var money_display = $MoneyDisplay

func _ready() -> void:
	load_shop()
	load_inventory()
	
func load_shop() -> void:
	# Clear any existing items in the container
	for child in items_container.get_children():
		child.queue_free()

	# Loop through our list of item data
	for trophy: Global.Trophy in Global.shop:
		var buyable_instance = BUYABLE_SCENE.instantiate()
		
		items_container.add_child(buyable_instance)
		
		buyable_instance.set_trohy_info(trophy)
		buyable_instance.connect("item_bought", Callable(self, "_on_button_pressed"))
		
func load_inventory() -> void:
	for child in inventory_container.get_children():
		child.queue_free()

	# Loop through our list of item data
	for trophy: Global.Trophy in Global.trophies:
		var buyable_instance = BUYABLE_SCENE.instantiate()
		
		inventory_container.add_child(buyable_instance)
		
		buyable_instance.set_trohy_info(trophy)
		buyable_instance.price_label.text = "OWNED"
		buyable_instance.price_label.set("theme_override_colors/font_color", Color.GREEN)
		buyable_instance.trophy_image.disabled = true

func _on_exit_button_exit_pressed() -> void:
	get_tree().change_scene_to_file("res://main_menu/MainMenu.tscn")

func buy(buyable: Node):
	if Global.money < buyable.price:
		fading_text.display_text("You cannot afford that!", Color.RED)
		return
		
	# Can afford it
	# 1) Subtract money
	# 2) Add trophy to inventory
	# 3) Refresh list
	# 4) Save data
	money_display.subtract_money(buyable.price)
	Global.add_trophy(buyable.trophy_type)
	
	fading_text.display_text("Successfully bought dessert!", Color.GREEN)
	Global.save_global_data()
	
	var buyable_instance = BUYABLE_SCENE.instantiate()
		
	inventory_container.add_child(buyable_instance)
	
	buyable_instance.set_trohy_info(buyable.trophy_type)
	buyable_instance.price_label.text = "OWNED"
	buyable_instance.price_label.set("theme_override_colors/font_color", Color.GREEN)
	buyable_instance.trophy_image.disabled = true

# When the player clicks on a shop item
func _on_button_pressed(buyable: Node):
	print("Player is attempting to buy Global.Trophy(", buyable.trophy_type, ")")
	buy(buyable)
