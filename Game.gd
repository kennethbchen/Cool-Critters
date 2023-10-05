extends Node2D


@export_group("Rock")
@export var rock_scene: PackedScene

@export var rock_origin: Marker2D

@export var rock_spawn_radius: float = 80

@export_group("Critter")
@export var critter_scene: PackedScene

@export var critter_spawn_radius: float = 10

@onready var critter_parent: Node = $Critters

var rand: RandomNumberGenerator

# Called when the node enters the scene tree for the first time.
func _ready():
	rand = RandomNumberGenerator.new()
	
	var spawn_point = rock_origin.position + Vector2(rand.randi_range(-rock_spawn_radius, rock_spawn_radius), rand.randi_range(-rock_spawn_radius, rock_spawn_radius))
	
	var rock = rock_scene.instantiate()
	add_child(rock)
	rock.position = spawn_point
	
	for i in range(0, rand.randi_range(4, 10)):
		var critter = critter_scene.instantiate()
		critter_parent.add_child(critter)
		critter.position = spawn_point + Vector2(rand.randi_range(-critter_spawn_radius, critter_spawn_radius), rand.randi_range(-critter_spawn_radius, critter_spawn_radius))


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
