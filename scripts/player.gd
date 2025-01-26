extends CharacterBody2D
class_name Player


@export var walk_speed := 300.0
@export var jump_velocity := 400.0
@export var swim_speed := 100.0

#sprite flipping vars
@export var sprite : AnimatedSprite2D
var scalebase

@onready var ground_controller: Node = $GroundController
@onready var water_controller: Node = $WaterController
@onready var oxygen_timer: OxygenTimer = %OxygenTimer


var active_controller: Node:
	set(value):
		motion_mode = (MOTION_MODE_GROUNDED if value == ground_controller
					   else MOTION_MODE_FLOATING)
		active_controller = value


func _ready() -> void:
	# assume we start game on the ground
	active_controller = water_controller
	
	#get the basescale for the sprite flipping
	scalebase = sprite.scale.x
	
	# give controllers access to player
	for controller in [ground_controller, water_controller]:
		controller.player = self
		
func _process(delta: float) -> void:
	if velocity.x < 0:
		sprite.scale.x = scalebase * -1
	elif velocity.x > 0: 
		sprite.scale.x = scalebase

func _physics_process(delta: float) -> void:
	active_controller.update(delta)

func fill_oxygen() -> void:
	oxygen_timer.oxygen = 100
