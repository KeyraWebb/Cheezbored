extends Node2D

@onready var pipes: Node2D = $Pipes
@onready var oxygen_timer: OxygenTimer = %OxygenTimer

signal set_respawn(respawn_position: Vector2)


func _ready() -> void:
	pipes.process_mode = Node.PROCESS_MODE_DISABLED
	pipes.hide()


func on_beacon_placed() -> void:
	pipes.process_mode = Node.PROCESS_MODE_INHERIT
	pipes.show()
	oxygen_timer.oxygen = 100
	set_respawn.emit(global_position)
