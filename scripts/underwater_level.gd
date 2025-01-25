extends Node2D

signal on_level_complete
signal on_death

@onready var oxygen_timer: OxygenTimer = %OxygenTimer
@onready var player: Player = $Player

var game: Game
var spawnpoint: Vector2


func _ready() -> void:
	game = get_parent()
	spawnpoint = player.position


func _on_death() -> void:
	game.die()
	
	
func restart() -> void:
	oxygen_timer.oxygen = 100
	player.position = spawnpoint
	
