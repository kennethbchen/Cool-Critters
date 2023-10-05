extends Node2D

@export var speed: = 0.25

var rand: RandomNumberGenerator


func _ready():
	
	rand = RandomNumberGenerator.new()
	rand.randomize()
	
	rotation_degrees = rand.randf_range(-180, 180)

func _process(delta):
	
	position += transform.x * speed
