extends Area2D

@onready var tooltip: Tooltip = $tooltip

var player_is_near := false
var player: Player


func _on_body_entered(body: Node2D) -> void:
	if body is not Player:
		return
	player = body
	player_is_near = true
	tooltip.display_tooltip("refill tank")


func _on_body_exited(body: Node2D) -> void:
	if body is not Player:
		return
	player_is_near = false
	tooltip.hide_tooltip()


func _input(event: InputEvent) -> void:
	if not player_is_near:
		return
	if event.is_action_pressed("interact"):
		player.fill_oxygen()
