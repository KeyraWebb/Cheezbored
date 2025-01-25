extends Control

@export var deplete_delay: int
@export var oxygen_display: Label
@export var low_oxygen_color: Color

var deplete_timer = 0
var oxygen = 100

signal on_depleted


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	if deplete_timer >= deplete_delay:
		oxygen -= 1
		deplete_timer = 0
	elif oxygen >= 0:
		deplete_timer += 1
		
	if oxygen < 20:
		oxygen_display.set("theme_override_colors/font_color", low_oxygen_color)
	
	oxygen_display.text = "Oxygen: " + str(oxygen) + "%"
	
	if oxygen < 0:
		oxygen_depleted()
	

#for when oxygen runs out
func oxygen_depleted():
	oxygen_display.text = "Oxygen: N/A"
	
