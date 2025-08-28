extends Node2D

var nums = []

var item_count = 6
var items = range(item_count + 1).slice(1)

var base_spins = 25

var animation_num1 = 1
var animation_num2 = 1
var animation_num3 = 1

const default_time = 0.05
signal spin_result

@onready var item1 = $Item1
@onready var item2 = $Item2
@onready var item3 = $Item3


"""
		if i > 25:
			time = 0.4
		elif i > 15:
			time = 0.1
"""

func spin_slot(item, delay):
	await get_tree().create_timer(delay).timeout
	var time = default_time
	var spins = randi_range(base_spins, base_spins + (2 * item_count))
	for i in range (spins):
		await get_tree().create_timer(time).timeout
		var animation_num = items[i % len(items)]
		item.play(str(animation_num))

	var rand_num = randi_range(1, 6)
	item.play(str(rand_num))
	time = default_time
	nums.append(rand_num)
	return


func spin():
	print(items)

	spin_slot(item1, 0)
	spin_slot(item2, 0.5)
	await spin_slot(item3, 1)
	var results_list = nums
	emit_signal("spin_result", results_list)
	nums = []
	return
