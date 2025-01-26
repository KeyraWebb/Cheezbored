extends Node

var player: Player


func update(delta: float) -> void:
	# Add the gravity.
	if not player.is_on_floor():
		player.velocity += player.get_gravity() * delta

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_vector("move_left", "move_right", "move_up", "move_down")
	if direction:
		player.velocity = direction * player.swim_speed
		print("player x: %".format([player.position.x], "%"))
	else:
		player.velocity = Vector2.ZERO

	player.move_and_slide()
