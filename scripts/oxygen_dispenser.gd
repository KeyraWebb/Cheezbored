extends Area2D

@onready var oxygen_timer: Control = %OxygenTimer


func _on_body_entered(body: Node2D) -> void:
	if body is not Player:
		return
	print(body.name)
