extends Node

var player: Player


func update(delta: float) -> void:
	# Add the gravity.
	if not player.is_on_floor():
		player.velocity += player.get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") and player.is_on_floor():
		player.velocity.y = player.jump_velocity

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("move_left", "move_right")
	if direction:
		player.velocity.x = direction * player.walk_speed
	else:
		player.velocity.x = move_toward(player.velocity.x, 0, player.walk_speed)

	player.move_and_slide()
