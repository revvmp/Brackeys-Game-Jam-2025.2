extends PanelContainer

"""
	DONUT = 1_000,
	COOKIE = 5_000,
	CHEESECAKE = 15_000,
	CINNAMON_ROLL = 30_000,
	CAKE = 50_000,
	BISCUITS = 100_000,
"""
const SHOP_ITEM_PRICE = {
	5: 100_000, # Global.Trophy.BISCUITS
	4: 50_000, # Global.Trophy.CAKE
	3: 15_000, # Global.Trophy.CHEESECAKE
	2: 30_000, # Global.Trophy.COOKIE
	1: 5_000, # Global.Trophy.COOKIE
	0: 1_000 # Global.Trophy.DONUT 
}

var trophy_type: Global.Trophy
var price: int

signal item_bought(buyable: Node)

@onready var trophy_image = $HBoxContainer/VBoxContainer/TrophyImage
@onready var description_label = $HBoxContainer/Description
@onready var price_label = $HBoxContainer/VBoxContainer/Price

func format_number_with_commas(number: int) -> String:
	var number_string: String = str(number)
	var formatted_string: String = ""
	var count: int = 0
	
	for i in range(number_string.length() - 1, -1, -1):
		formatted_string = number_string[i] + formatted_string
		count += 1
		if count % 3 == 0 and i != 0:
			formatted_string = "," + formatted_string
			
	return formatted_string
	
func set_trohy_info(trophy: Global.Trophy):
	trophy_image.texture_normal = Global.SHOP_ITEM_IMAGES[trophy]
	trophy_image.texture_hover = Global.SHOP_ITEM_IMAGES_HOVER[trophy]
	trophy_image.texture_pressed = Global.SHOP_ITEM_IMAGES_PRESSED[trophy]
	
	description_label.text = Global.SHOP_ITEM_DESC[trophy]
	price_label.text = "$" + format_number_with_commas(SHOP_ITEM_PRICE[trophy])
	
	price = SHOP_ITEM_PRICE[trophy]
	trophy_type = trophy

func _on_trophy_image_pressed() -> void:
	item_bought.emit(self)
