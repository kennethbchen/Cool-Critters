extends Node2D

var speed: = 0.25

var rand: RandomNumberGenerator


func _ready():
	
	rand = RandomNumberGenerator.new()
	rand.randomize()
	
	speed = rand.randf_range(0.05, 0.25)
	
	rotation_degrees = rand.randf_range(-180, 180)
	
	

func _process(delta):
	
	position += transform.x * speed
