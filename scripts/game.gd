extends Node
class_name Game

@onready var main_menu: Control = $"main menu"
@onready var underwater_level: Node2D = $UnderwaterLevel

@onready var death_screen: Control = $DeathScreen
@onready var respawn_timer: Timer = $DeathScreen/RespawnTimer

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
	remove_child(underwater_level)
	

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


func die() -> void:
	remove_child(active_level)
	death_screen.show()
	respawn_timer.start()


func _on_respawn_timer_timeout() -> void:
	death_screen.hide()
	active_level.restart()
	add_child(active_level)
