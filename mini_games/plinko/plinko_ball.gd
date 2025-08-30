extends RigidBody2D

var my_tween = create_tween().set_loops()

func _ready() -> void:
	my_tween.tween_property(self, "position", Vector2(1000, self.position.y), 2.0)
	my_tween.tween_property(self, "position", Vector2(280, self.position.y), 2.0)

func unfreeze():
	if my_tween and my_tween.is_running():
		my_tween.kill()
	self.set("freeze", false)
