extends Sprite2D


# Called when the node enters the scene tree for the first time.
func _ready():
	
	var scale_tween = get_tree().create_tween()
	scale_tween.set_trans(Tween.TRANS_QUAD)
	scale_tween.set_ease(Tween.EASE_IN_OUT)
	scale_tween.tween_property(self, "scale", Vector2(.35, .45), 0.6)
	scale_tween.tween_property(self, "scale", Vector2(.65, .55), 0.6)
	scale_tween.set_loops()
	
	var rot_tween = get_tree().create_tween()
	rot_tween.set_trans(Tween.TRANS_QUAD)
	rot_tween.tween_property(self, "rotation_degrees", 13, 1.23)
	rot_tween.tween_property(self, "rotation_degrees", -13, 1.23)
	rot_tween.set_loops()
