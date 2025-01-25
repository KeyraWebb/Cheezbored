extends Area2D

@export var tooltip: Control

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass



func _on_area_entered(area: Area2D) -> void:
	print("entering")
	#if area.get_parent() == Player:
	tooltip.display_tooltip("place beacon")

func _on_area_exited(area: Area2D) -> void:
	print("leaving")
	#if area.get_parent() == Player:
	tooltip.hide_tooltip()
