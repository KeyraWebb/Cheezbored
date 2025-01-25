extends Node2D

signal on_level_complete
signal on_death

var game: Game


func _ready() -> void:
	game = get_parent()


func _on_death() -> void:
	print("restarting level!")
	
