extends Node2D

signal on_level_complete
signal on_death

@onready var oxygen_timer: OxygenTimer = %OxygenTimer
@onready var player: Player = $Player
@onready var event_triggers: EventTriggers = $EventTriggers
@onready var health_meter: HealthMeter = %HealthMeter

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
	event_triggers.reset
	

func _on_beacon_set_respawn(respawn_position: Vector2) -> void:
	spawnpoint = respawn_position
