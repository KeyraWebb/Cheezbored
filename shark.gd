extends Sprite2D

@export var movedelaymax: int
@export var movedelaymin: int
@export var movespeed: int
var visibletarget
@export var player:CharacterBody2D
var currentdelay = 0
var rng = RandomNumberGenerator.new()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	currentdelay = rng.randi_range(movedelaymin,movedelaymax)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if visibletarget:
		pass
	elif currentdelay <= 0:
		currentdelay = rng.randi_range(movedelaymin, movedelaymax)
		pass
	else:
		currentdelay -= 1
	pass
