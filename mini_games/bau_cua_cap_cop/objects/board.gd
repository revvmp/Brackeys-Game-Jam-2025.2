extends Node2D


func get_all_values():
	var values = {}
	for slot in get_children():
		if slot.has_method("get_value"):
			values[slot.slot_type] = slot.get_value()
	print(values)
	return values
