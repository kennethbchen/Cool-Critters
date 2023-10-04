extends Sprite2D

@export var scale_a = Vector2(.3, .4)
@export var scale_b = Vector2(0.65, .55)

@export var scale_duration: float = 0.6

@export var rotation_a: float = 13
@export var rotation_b: float = -13
@export var rotation_duration: float = 1.23

var scale_tween: Tween
var rot_tween: Tween

# Called when the node enters the scene tree for the first time.
func _ready():
	
	scale_tween = get_tree().create_tween()
	scale_tween.set_trans(Tween.TRANS_QUAD)
	scale_tween.set_ease(Tween.EASE_IN_OUT)
	scale_tween.tween_property(self, "scale", scale_a, scale_duration)
	scale_tween.tween_property(self, "scale", scale_b, scale_duration)
	scale_tween.set_loops()
	
	rot_tween = get_tree().create_tween()
	rot_tween.set_trans(Tween.TRANS_QUAD)
	rot_tween.tween_property(self, "rotation_degrees", rotation_a, rotation_duration)
	rot_tween.tween_property(self, "rotation_degrees", rotation_b, rotation_duration)
	rot_tween.set_loops()

func _exit_tree():
	scale_tween.stop()
	rot_tween.stop()
