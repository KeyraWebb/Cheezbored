extends Control

signal on_play_pressed


func _on_play_button_pressed() -> void:
	print("pressed play???")
	on_play_pressed.emit()
