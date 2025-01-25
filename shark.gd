extends CharacterBody2D

@export var movedelaymax: int
@export var movedelaymin: int
@export var movespeed: int
var visibletarget
@export var player: CharacterBody2D
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
	
func _physics_process(delta: float) -> void:
	if visibletarget:
		chase_player(delta)
		
		
func chase_player(delta) -> void:
	var player_position = player.global_position
	var my_position = position
	var direction = global_position.direction_to(player_position)
	velocity = direction * movespeed
	move_and_slide()
	
	
func _on_sight_area_entered(area: Area2D) -> void:
	if area.get_parent() == player:
		visibletarget = player
		

func _on_sight_area_exited(area: Area2D) -> void:
	if area.get_parent() == player:
		visibletarget = null
