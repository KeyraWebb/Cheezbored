extends Node2D

@onready var pipes: Node2D = $Pipes


func _ready() -> void:
	pipes.process_mode = Node.PROCESS_MODE_DISABLED
	pipes.hide()


func on_beacon_placed() -> void:
	pipes.process_mode = Node.PROCESS_MODE_INHERIT
	pipes.show()
