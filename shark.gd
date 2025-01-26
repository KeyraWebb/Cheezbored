extends CharacterBody2D

@export var movedelaymax: int
@export var movedelaymin: int
@export var movespeed: int
var visibletarget
@export var player: CharacterBody2D
var currentdelay = 0
var rng = RandomNumberGenerator.new()
@export var sprite: AnimatedSprite2D

var currentdirection = 1
var scalebase

var killplayer : Signal

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	currentdelay = rng.randi_range(movedelaymin,movedelaymax)
	scalebase = sprite.scale.x
	
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
	
	#getting direction of the shark
	if velocity.x > 0:
		sprite.scale.x = scalebase * -1
	elif velocity.x < 0: 
		sprite.scale.x = scalebase
		
	
		
	
	
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


func _on_killzone_area_entered(area: Area2D) -> void:
	if area.get_parent() == player:
		killplayer.emit()
