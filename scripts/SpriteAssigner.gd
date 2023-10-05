extends Node2D

@export var sprite: Sprite2D

@export var textures: Array[Texture2D]

var rand: RandomNumberGenerator

func _ready():

	rand = RandomNumberGenerator.new()
	rand.randomize()
	
	sprite.texture = textures[rand.randi_range(0, len(textures) - 1)]
