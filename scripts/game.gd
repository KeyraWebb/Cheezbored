extends Node

const UNDERWATER_LEVEL_PRELOAD = preload("res://scenes/underwater_level.tscn")

@onready var main_menu: Control = $"main menu"

var underwater_level: Node2D
var city_level: Node2D


var active_level: Node2D:
	set(value):
		if not active_level:
			print("no active level right now")
		else:
			remove_child(active_level)
		active_level = value
		if active_level:
			add_child(active_level)


func _ready() -> void:		
	# open level scenes but make them inactive
	underwater_level = UNDERWATER_LEVEL_PRELOAD.instantiate()


func _on_menu_play_pressed() -> void:
	print("pressed play!")
	if not active_level:
		active_level = underwater_level
	else:
		add_child(active_level)
	remove_child(main_menu)


func _input(event: InputEvent) -> void:
	if event.is_action_pressed("pause"):
		print("paused")
		add_child(main_menu)
		remove_child(active_level)
