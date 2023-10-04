extends Node2D

@export var textures: Array[Texture2D]

@export var speed: = 0.25

@onready var sprite: Sprite2D = $CritterSprite

var rand: RandomNumberGenerator
# Called when the node enters the scene tree for the first time.
func _ready():
	
	rand = RandomNumberGenerator.new()
	rand.randomize()
	
	sprite.texture = textures[rand.randi_range(0, len(textures))]
	
	rotation_degrees = rand.randf_range(-180, 180)

func _process(delta):
	
	position += transform.x * speed
