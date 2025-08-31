extends CanvasLayer

signal on_transition_finished

@onready var color_rect = $ColorRect
@onready var animation_player = $AnimationPlayer
@onready var timer = $Timer

func _ready():
	color_rect.visible = false
	animation_player.animation_finished.connect(
		_on_animation_finished
	)

func _on_animation_finished(anim_name):
	if anim_name == "fade_to_black" or anim_name == "fade_to_black_extend":
		on_transition_finished.emit()
		animation_player.play("fade_to_normal")
	elif anim_name == "fade_to_normal":
		color_rect.visible = false

func transition():
	color_rect.visible = true
	animation_player.play("fade_to_black")

func transition_to_main_menu():
	timer.start()
	await timer.timeout
	color_rect.visible = true
	animation_player.play("fade_to_black_extend")
	await on_transition_finished
	get_tree().change_scene_to_file("res://main_menu/MainMenu.tscn")
	
