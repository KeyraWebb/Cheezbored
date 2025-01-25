extends CharacterBody2D
class_name Player


@export var walk_speed := 300.0
@export var jump_velocity := 400.0

@onready var ground_controller: Node = $GroundController
@onready var water_controller: Node = $WaterController

var active_controller: Node


func _ready() -> void:
	# assume we start game on the ground
	active_controller = ground_controller
	
	# give controllers access to player
	for controller in [ground_controller, water_controller]:
		controller.player = self
		

func _physics_process(delta: float) -> void:
	active_controller.update(delta)
