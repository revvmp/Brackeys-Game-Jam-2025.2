extends PanelContainer

const SHOP_ITEM_IMAGES = {
	5: preload("res://assets/shop_items/GameJam_biscuit.png"), # Global.Trophy.BISCUITS
	4: preload("res://assets/shop_items/GameJam_cake.png"), # Global.Trophy.CAKE
	3: preload("res://assets/shop_items/GameJam_cheesecake.png"), # Global.Trophy.CHEESECAKE
	2: preload("res://assets/shop_items/GameJam_Cinnamonrolls.png"), # Global.Trophy.CINNAMON_ROLL
	1: preload("res://assets/shop_items/GameJam_Cookie.png"), # Global.Trophy.COOKIE
	0: preload("res://assets/shop_items/GameJam_Donut.png"), # Global.Trophy.DONUT 
}

const SHOP_ITEM_DESC = {
	5: "A delicious warm poptart.. I mean biscuit, you've risked it all and you finally managed to get this innocent looking pastry to prove it.", # Global.Trophy.BISCUITS
	4: "CAKE", # Global.Trophy.CAKE
	3: "CHEESECAKE", # Global.Trophy.CHEESECAKE
	2: "CINNAMON ROLL", # Global.Trophy.COOKIE
	1: "COOKIE", # Global.Trophy.COOKIE
	0: "DONUT", # Global.Trophy.DONUT 
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

@onready var trophy_image = $HBoxContainer/VBoxContainer/TrophyImage
@onready var description_label = $HBoxContainer/Description
@onready var price_label = $HBoxContainer/VBoxContainer/Price

func set_trohy_info(trophy: Global.Trophy):
	trophy_image.texture = SHOP_ITEM_IMAGES[trophy]
	description_label.text = SHOP_ITEM_DESC[trophy]
	price_label.text = "$" + str(SHOP_ITEM_PRICE[trophy])
	
