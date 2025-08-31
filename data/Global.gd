extends Node

# ORDRED BY PRICE
enum Trophy {
	# TROPHY_NAME = (ID, PRICE)
	DONUT = 0,
	COOKIE = 1,
	CHEESECAKE = 2,
	CINNAMON_ROLL = 3,
	CAKE = 4,
	BISCUITS = 5,
}

enum Price {
	# TROPHY_NAME = (ID, PRICE)
	DONUT = 1_000,
	COOKIE = 5_000,
	CHEESECAKE = 15_000,
	CINNAMON_ROLL = 30_000,
	CAKE = 50_000,
	BISCUITS = 100_000,
}

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
	4: "CAKE\n\nThe undisputed sweet treat of everyone's birthday. In your case, the 2nd to last dessert to buy right before completing this game!", # Global.Trophy.CAKE
	3: "CHEESECAKE\n\nOriginally created as an \"energy-boosting\" food, now one of the most popular dessert options, and the birth of the New York Style cheesecake after Cream Cheese was invented.", # Global.Trophy.CHEESECAKE
	2: "CINNAMON ROLL\n\nEvolved from sweet rolls back in the in ancient times and now is a dessert staple. Typically seasoned with cinnamon and vanilla glaze in modern times.", # Global.Trophy.COOKIE
	1: "COOKIE\n\nYou can have cookies in a billion different ways, personally our favorite is oatmeal raisins. Just in the United States alone, 2 billion cookies are purchased each YEAR!", # Global.Trophy.COOKIE
	0: "DONUT\n\nAbout 190 calories of perfection, can't get better and simpler than this when it comes to desserts. Only for $1,000!", # Global.Trophy.DONUT 
}

const GAME_WIDTH = 1280
const GAME_HEIGHT = 720
const SAVE_FILE_NAME = "user://devilsdeal.save"
const START_MONEY = 100

var money: int = START_MONEY
var trophies: Array = []
var shop: Array = []

func _ready() -> void:
	if not FileAccess.file_exists(SAVE_FILE_NAME):
		wipe_game()
		return # Fresh Game, instantiate objects
	load_game()
	print("Successfully loaded previous game data")
	print("MONEY: ", money)
	print("TROPHIES: ", trophies)
	print("SHOP: ", shop)
	# Wipe the user's data if they hit $0
	if money <= 0:
		wipe_game()

func set_money(new_money: int):
	money = new_money
	
func add_trophy(trophy: Trophy):
	trophies.append(trophy)

func _save_json():
	var save_dict = {
		"filename": get_scene_file_path(),
		"money": money,
		"trophies": trophies,
		"shop": shop,
	}
	
	return save_dict

func save_global_data():
	var save_file = FileAccess.open(SAVE_FILE_NAME, FileAccess.WRITE)
	save_file.store_line(
		JSON.stringify(
			_save_json()
		)
	)
	
func load_game():
	# Load the file line by line and process that dictionary to restore
	# the object it represents.
	var save_file = FileAccess.open(SAVE_FILE_NAME, FileAccess.READ)
	while save_file.get_position() < save_file.get_length():
		var json_string = save_file.get_line()

		# Creates the helper class to interact with JSON.
		var json = JSON.new()

		# Check if there is any error while parsing the JSON string, skip in case of failure.
		var parse_result = json.parse(json_string)
		if not parse_result == OK:
			print("JSON Parse Error: ", json.get_error_message(), " in ", json_string, " at line ", json.get_error_line())
			continue

		# Get the data from the JSON object.
		var node_data = json.data

		# Now we set the remaining variables.
		money = node_data["money"]
		trophies = node_data["trophies"]
		shop = node_data["shop"]

func wipe_game():
	DirAccess.remove_absolute(SAVE_FILE_NAME)
	money = START_MONEY
	trophies = []
	shop = [
		Trophy.DONUT,
		Trophy.COOKIE,
		Trophy.CHEESECAKE,
		Trophy.CINNAMON_ROLL,
		Trophy.CAKE,
		Trophy.BISCUITS,
	]
	print("INSTANTIED NEW SAVE - TROPHIES: ", trophies, " | SHOP: ", shop, " | Money: ", money)
	save_global_data()
