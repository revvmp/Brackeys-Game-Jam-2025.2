extends Node2D

@onready var main_wheel = $MainWheel
@onready var purple = $MainWheel/Area2D
@onready var brownish = $MainWheel/Area2D2 
@onready var green = $MainWheel/Area2D3
@onready var red = $MainWheel/Area2D4
@onready var pink = $MainWheel/Area2D5
@onready var yellowish = $MainWheel/Area2D6
@onready var light_green = $MainWheel/Area2D7
@onready var coral = $MainWheel/Area2D8
@onready var arrow = $Arrow/ArrowArea
signal win_money
signal lose_money


func _on_button_spin_wheel() -> void:
	var rotation_amount = randf_range(TAU*10, TAU*20)
	var tween = create_tween()
	tween.tween_property(main_wheel, "rotation", rotation_amount, 5).set_trans(Tween.TRANS_QUAD) \
	.set_ease(Tween.EASE_OUT)
	await tween.finished
	print("finished")
	print(arrow.get_overlapping_areas())
	
	if arrow.overlaps_area(purple) or arrow.overlaps_area(green) or arrow.overlaps_area(pink) \
	or arrow.overlaps_area(coral):
		emit_signal("win_money")
		
	if arrow.overlaps_area(brownish) or arrow.overlaps_area(red) or arrow.overlaps_area(yellowish) \
	or arrow.overlaps_area(light_green):
		emit_signal("lose_money")
