extends Control
class_name Tooltip

@export var tooltiptext: Label

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func display_tooltip(action: String) -> void:
	tooltiptext.text = "Press E to " + action
	self.visible = true
	
func hide_tooltip() -> void:
	self.visible = false
