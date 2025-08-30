extends PanelContainer

const SHOP_ITEM_IMAGES = {
	5: preload("res://assets/shop_items/GameJam_biscuit.png"), # Global.Trophy.BISCUITS
	4: preload("res://assets/shop_items/GameJam_cake.png"), # Global.Trophy.CAKE
	3: preload("res://assets/shop_items/GameJam_cheesecake.png"), # Global.Trophy.CHEESECAKE
	2: preload("res://assets/shop_items/GameJam_Cinnamonrolls.png"), # Global.Trophy.CINNAMON_ROLL
	1: preload("res://assets/shop_items/GameJam_Cookie.png"), # Global.Trophy.COOKIE
	0: preload("res://assets/shop_items/GameJam_Donut.png"), # Global.Trophy.DONUT 
}

const SHOP_ITEM_IMAGES_HOVER = {
	5: preload("res://assets/shop_items/shop_item_buttons/shop_item_hovered/biscuit_hover.png"), # Global.Trophy.BISCUITS
	4: preload("res://assets/shop_items/shop_item_buttons/shop_item_hovered/cake_hover.png"), # Global.Trophy.CAKE
	3: preload("res://assets/shop_items/shop_item_buttons/shop_item_hovered/cheesecake_hover.png"), # Global.Trophy.CHEESECAKE
	2: preload("res://assets/shop_items/shop_item_buttons/shop_item_hovered/cinnamonroll_hover.png"), # Global.Trophy.CINNAMON_ROLL
	1: preload("res://assets/shop_items/shop_item_buttons/shop_item_hovered/cookie_hover.png"), # Global.Trophy.COOKIE
	0: preload("res://assets/shop_items/shop_item_buttons/shop_item_hovered/donut_hover.png"), # Global.Trophy.DONUT 
}

const SHOP_ITEM_IMAGES_PRESSED = {
	5: preload("res://assets/shop_items/shop_item_buttons/shop_item_pressed/biscuit_pressed.png"), # Global.Trophy.BISCUITS
	4: preload("res://assets/shop_items/shop_item_buttons/shop_item_pressed/cake_pressed.png"), # Global.Trophy.CAKE
	3: preload("res://assets/shop_items/shop_item_buttons/shop_item_pressed/cheesecake_pressed.png"), # Global.Trophy.CHEESECAKE
	2: preload("res://assets/shop_items/shop_item_buttons/shop_item_pressed/cinnamonroll_pressed.png"), # Global.Trophy.CINNAMON_ROLL
	1: preload("res://assets/shop_items/shop_item_buttons/shop_item_pressed/cookie_pressed.png"), # Global.Trophy.COOKIE
	0: preload("res://assets/shop_items/shop_item_buttons/shop_item_pressed/donut_pressed.png"), # Global.Trophy.DONUT 
}

const SHOP_ITEM_DESC = {
	5: "BISCUIT\n\nA delicious warm poptart.. I mean biscuit, you've risked your entire life savings multiple times and you finally managed to get this innocent looking pastry to prove it.", # Global.Trophy.BISCUITS
	4: "CAKE\n\nThe undispuated sweet treat of everyone's birthday. In your case, the 2nd to last dessert to buy right before completing this game!", # Global.Trophy.CAKE
	3: "CHEESECAKE\n\nOriginally created as an \"energy-boosting\" food, now one of the most popular dessert options, and the birth of the New York Stlye cheesecake after Cream Cheese was invented.", # Global.Trophy.CHEESECAKE
	2: "CINNAMON ROLL\n\nEvolved from sweet rolls back in the in ancient times and now is a dessert staple. Typicaly seasoned with cinnamon and vanilla glaze in modern times.", # Global.Trophy.COOKIE
	1: "COOKIE\n\nYou can have cookies in a billion different ways, personally our favorite is oatmeal raisins. Just in the United States alone, 2 billion cookies are purchased each YEAR!", # Global.Trophy.COOKIE
	0: "DONUT\n\nAbout 190 calories of perfection, can't get better and simpler than this when it comes to desserts. Only for $1,000!", # Global.Trophy.DONUT 
}

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
	trophy_image.texture_normal = SHOP_ITEM_IMAGES[trophy]
	trophy_image.texture_hover = SHOP_ITEM_IMAGES_HOVER[trophy]
	trophy_image.texture_pressed = SHOP_ITEM_IMAGES_PRESSED[trophy]
	
	description_label.text = SHOP_ITEM_DESC[trophy]
	price_label.text = "$" + format_number_with_commas(SHOP_ITEM_PRICE[trophy])
	
	price = SHOP_ITEM_PRICE[trophy]
	trophy_type = trophy

func _on_trophy_image_pressed() -> void:
	item_bought.emit(self)
