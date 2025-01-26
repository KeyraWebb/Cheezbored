extends CharacterBody2D

@export var movedelaymax: int
@export var movedelaymin: int
@export var movespeed: int
var visibletarget
var currentdelay = 0
var rng = RandomNumberGenerator.new()
var movetimer: int
var movedirection: Vector2

@export var sprite: Node2D

@onready var timer: Timer = $Timer

var currentdirection := 1:
	set(value):
		currentdirection = value
		sprite.scale.x = currentdirection


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	currentdelay = rng.randi_range(movedelaymin,movedelaymax)
	start_timer()
	

func _physics_process(delta: float) -> void:
	move_idly() 
	


func move_idly() -> void:
	velocity = Vector2.RIGHT * currentdirection * movespeed
	move_and_slide()
		
		
func start_timer() -> void:
	timer.wait_time = rng.randf_range(1, 2)
	timer.start()


func _on_timer_timeout() -> void:
	print("changed direction")
	currentdirection = -currentdirection
	start_timer()
