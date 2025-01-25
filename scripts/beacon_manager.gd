extends Node2D

var beacons: Array[Beacon]

signal on_checkpoint_reached(index: int)


func _ready() -> void:
	# retrieve list of beacons
	var children := get_children()
	for child in children:
		if child is Beacon:
			beacons.push_back(child)
	
	# sort in order of x axis
	beacons.sort_custom(sort_by_position)
	
	# connect to beacon placement 
	for i in range(beacons.size()):
		beacons[i].index = i
		beacons[i].mark_beacon.connect(_on_beacon_placed)
	
	
func sort_by_position(a: Node2D, b: Node2D) -> bool:
	return a.position.x < b.position.x


func _on_beacon_placed(index: int):
	on_checkpoint_reached.emit(index)
	print("reached checkpoint %".format([index + 1], "%"))
