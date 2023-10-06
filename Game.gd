extends Node2D


@export_group("Rock")
@export var rock_scene: PackedScene

@export var rock_origin: Marker2D

@export var rock_spawn_radius: float = 80

@export_group("Critter")
@export var critter_scene: PackedScene

@export var critter_spawn_radius: float = 10

@onready var critter_parent: Node = $Critters

@onready var sfx_controller: SoundEffectController = $SoundEffectController

var rock_not_moved: bool = true

var rand: RandomNumberGenerator

var spawn_point: Vector2

func _ready():
	rand = RandomNumberGenerator.new()
	
	spawn_point = rock_origin.position + Vector2(rand.randi_range(-rock_spawn_radius, rock_spawn_radius), rand.randi_range(-rock_spawn_radius, rock_spawn_radius))
	
	var rock = rock_scene.instantiate()
	add_child(rock)
	rock.rock_moved.connect(_on_rock_moved)
	rock.position = spawn_point
	
	
func _spawn_critters():
	for i in range(0, rand.randi_range(4, 10)):
		var critter = critter_scene.instantiate()
		critter_parent.add_child(critter)
		critter.position = spawn_point + Vector2(rand.randi_range(-critter_spawn_radius, critter_spawn_radius), rand.randi_range(-critter_spawn_radius, critter_spawn_radius))

func _on_rock_moved():
	if rock_not_moved:
		rock_not_moved = false
		_spawn_critters()
		sfx_controller.play("applause")

