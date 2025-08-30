extends Node2D

@export var help_information: String

const INFO_BOX = preload("res://ui/game_help/InformationBox.tscn")
var info_box

func _on_texture_button_pressed() -> void:
	if info_box:
		return
		
	var info_box_node = INFO_BOX.instantiate()
	
	get_parent().add_child(info_box_node)
	
	info_box_node.position.x = Global.GAME_WIDTH / 2
	info_box_node.position.y = 300
	info_box_node.scale = Vector2(2.0, 2.0)
	info_box_node.information_label.text = help_information
	
	info_box = info_box_node
