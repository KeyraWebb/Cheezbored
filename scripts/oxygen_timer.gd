extends Control

var oxygen = 100
@export var deplete_delay: int
var deplete_timer = 0
@export var oxygen_display: Label

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if deplete_timer >= deplete_delay:
		oxygen -= 1
		deplete_timer = 0
	else:
		deplete_timer += 1
	
	oxygen_display.text = "Oxygen: " + str(oxygen) + "%"
	pass
	
