extends Node2D
class_name EventTriggers

@onready var player: Player = $"../Player"

@export var events: Array[ScriptedEvent]

var checkpoints: Array[float]


func _ready() -> void:
	events.sort_custom(sort_by_position)


func sort_by_position(a: Node2D, b: Node2D) -> bool:
	return a.position.x < b.position.x
