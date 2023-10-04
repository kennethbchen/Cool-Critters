extends Sprite2D

var scale_tween: Tween
var rot_tween: Tween

# Called when the node enters the scene tree for the first time.
func _ready():
	
	scale_tween = get_tree().create_tween()
	scale_tween.set_trans(Tween.TRANS_QUAD)
	scale_tween.set_ease(Tween.EASE_IN_OUT)
	scale_tween.tween_property(self, "scale", Vector2(.3, .4), 0.6)
	scale_tween.tween_property(self, "scale", Vector2(.65, .55), 0.6)
	scale_tween.set_loops()
	
	rot_tween = get_tree().create_tween()
	rot_tween.set_trans(Tween.TRANS_QUAD)
	rot_tween.tween_property(self, "rotation_degrees", 13, 1.23)
	rot_tween.tween_property(self, "rotation_degrees", -13, 1.23)
	rot_tween.set_loops()

func _exit_tree():
	scale_tween.stop()
	rot_tween.stop()
