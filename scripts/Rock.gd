extends Area2D

var grab_pos: Vector2

var held = false

# This click and drag setup does not work with overlapping objects

func _unhandled_input(event):
	
	if held and event is InputEventMouseMotion:
		position = event.position - grab_pos

func _input_event(viewport: Viewport, event: InputEvent, shape_idx: int):
	
	if event.is_action_pressed("grab"):
		held = true
		grab_pos = event.position - position
	
	if event.is_action_released("grab"):
		held = false

