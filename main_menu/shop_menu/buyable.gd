extends Node2D

const shop_item_images = {
	Global.Trophy.BISCUITS: "res://assets/shop_items/GameJam_biscuit.png",
	Global.Trophy.CAKE: "res://assets/shop_items/GameJam_cake.png",
	Global.Trophy.CHEESECAKE: "res://assets/shop_items/GameJam_cheesecake.png",
	Global.Trophy.CINNAMON_ROLL: "res://assets/shop_items/GameJam_Cinnamonrolls.png",
	Global.Trophy.COOKIE: "res://assets/shop_items/GameJam_Cookie.png",
	Global.Trophy.DONUT: "res://assets/shop_items/GameJam_Donut.png",
}

# To be fileld out by shop
@export var cost: int
@export var trophy: Global.Trophy
@export var description: String

@onready var trophy_image = $TrophyImage
@onready var description_label = $Description
@onready var price_label = $Price

func _ready() -> void:
	description_label.text = description
	price_label.text = cost
