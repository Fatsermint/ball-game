extends Node3D

@onready var collisionshape: CollisionShape3D = $"Components/1/CSGBox3D/CSGSphere3D/CollisionShape3D"
@onready var player: CharacterBody3D = $Player
@onready var Map2: Node3D = $"Components/2"
@onready var Mapp1: Node3D = $"Components/1"
@onready var kill1: CollisionShape3D = $"Components/1/KillZone/Area3D/CollisionShape3D"
@onready var kill2: CollisionShape3D = $"Components/2/KillZone/Area3D/CollisionShape3D"


static var score = 0
var playerpos = 0
var nextGeneration = 0
var nextYGeneration = 0
var next = randf_range(0,1)

func _moremap():
	if next <= 0.5:
		var newMap = Mapp1.duplicate()
		newMap.position.x = nextGeneration
		newMap.position.y = nextYGeneration
		newMap.position.y = nextYGeneration
		newMap.position.z = 0.5 
		nextGeneration += 99
		nextYGeneration -= 10
		newMap.visible = true 
		print(nextGeneration, nextYGeneration)
		add_child(newMap)
		next = randf_range(0,1)
		print(next)
	else:
		var newMap2 = Map2.duplicate()
		newMap2.position.x = nextGeneration
		newMap2.position.y = nextYGeneration
		newMap2.position.z = 0
		nextGeneration += 99
		nextYGeneration -= 10
		newMap2.visible = true 
		print(nextGeneration, nextYGeneration)
		add_child(newMap2)
		next = randf_range(0,1)
		print(next)
func _ready() -> void:
	_moremap()

#4.8
func _process(delta: float) -> void:
	if player.position.x > playerpos:
		playerpos +=  100
		_moremap()
	score = player.position.x
		
