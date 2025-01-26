extends CharacterBody2D

@export var movedelaymax: int
@export var movedelaymin: int
@export var movespeed: int
var visibletarget
@export var player: CharacterBody2D
var currentdelay = 0
var rng = RandomNumberGenerator.new()
var movetimer: int
var movedirection: Vector2

@export var movelengthmax: int
@export var movelengthmin: int

@export var sprite: AnimatedSprite2D
@onready var health_meter: HealthMeter = %HealthMeter

var currentdirection = 1
var scalebase


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	currentdelay = rng.randi_range(movedelaymin,movedelaymax)
	scalebase = sprite.scale.x
	sprite.animation_finished.connect(reset_animation)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if visibletarget:
		pass
	elif currentdelay <= 0:
		currentdelay = rng.randi_range(movedelaymin, movedelaymax)
		movetimer = rng.randi_range(movelengthmax, movelengthmin)
		movedirection = Vector2(rng.randf_range(-1,1),rng.randf_range(-1,1))
	elif movetimer > 0:
		movetimer -= 1
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
	elif movetimer > 0:
		move_idly() 


func move_idly() -> void:
	velocity = movedirection * movespeed
	move_and_slide()
		
		
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


func reset_animation() -> void:
	sprite.play("default")


func _on_killzone_area_entered(area: Area2D) -> void:
	if area.get_parent() == player:
		sprite.play("attack")
		health_meter.health -= 15
