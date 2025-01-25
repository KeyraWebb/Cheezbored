extends Area2D

@export var tooltip: Control

var player_is_near := false

signal on_beacon_placed

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_area_entered(area: Area2D) -> void:
	player_is_near = true
	tooltip.display_tooltip("place beacon")
	

func _on_area_exited(area: Area2D) -> void:
	player_is_near = false
	tooltip.hide_tooltip()
	
	
func _input(event: InputEvent) -> void:
	if not player_is_near:
		return
	
	if event.is_action_pressed("interact"):
		hide()
		process_mode = PROCESS_MODE_DISABLED
		on_beacon_placed.emit()
