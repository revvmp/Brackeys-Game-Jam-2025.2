extends Node2D

@onready var main_wheel = $MainWheel

func _on_button_spin_wheel() -> void:
	var rotation_amount = randf_range(TAU*10, TAU*20)
	var tween = create_tween()
	tween.tween_property(main_wheel, "rotation", rotation_amount, 5).set_trans(Tween.TRANS_QUAD) \
	.set_ease(Tween.EASE_OUT)
	await tween
	
