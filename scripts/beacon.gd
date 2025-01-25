extends Node2D
class_name Beacon

@onready var pipes: Node2D = $Pipes
@onready var oxygen_timer: OxygenTimer = %OxygenTimer

var index: int

signal set_respawn(respawn_position: Vector2)
signal mark_beacon(i: int)


func _ready() -> void:
	pipes.process_mode = Node.PROCESS_MODE_DISABLED
	pipes.hide()


func on_beacon_placed() -> void:
	pipes.process_mode = Node.PROCESS_MODE_INHERIT
	pipes.show()
	oxygen_timer.oxygen = 100
	set_respawn.emit(global_position)
	mark_beacon.emit(index)
