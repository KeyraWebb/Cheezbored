extends Node2D

@export var player: Player

@onready var label: Label = $CanvasLayer/Label


# make sure that each zone's pivot point is on its far left!!
var zones: Array[Node2D]
var current_zone: Node2D:
	set(value):
		current_zone = value
		label.text = current_zone.name


func _ready() -> void:
	# finds all child nodes and adds to list if node is a zone
	var child_nodes := get_children()
	for node in child_nodes:
		if node.is_in_group("Zones"):
			zones.push_back(node)
	# sort list by x position
	zones.sort_custom(sort_zones)
	print(zones)


func _physics_process(delta: float) -> void:
	# the first zone starts around x = 0
	if player.position.x <= zones[0].position.x:
		current_zone = zones[0]
		return
	
	var zones_to_left := zones.filter(zones_to_player_left)
	current_zone = zones_to_left.pop_back()
	

# order by x position
func sort_zones(a: Node2D, b: Node2D) -> bool:
	return a.position.x < b.position.x
	
	
func zones_to_player_left(zone: Node2D) -> bool:
	return zone.position.x < player.position.x
