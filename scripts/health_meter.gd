extends Control
class_name HealthMeter

@export var display: Label
@export var low_health_color: Color

var color: Color
var health = 100:
	set(value):
		if value >= 100:
			display.set("theme_override_colors/font_color", color)
		health = value

signal on_depleted


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	color = display.get_theme_color("font_color")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:		
	if health < 20:
		display.set("theme_override_colors/font_color", low_health_color)
	
	if health <= 0:
		health_depleted()
	
	display.text = "Health: " + str(health) + "%"


#for when health runs out
func health_depleted():
	on_depleted.emit()
	
