extends RigidBody2D


@export var torque_strength: float = 3000.0  # Strength of the rotational force
@export var return_torque: float = 250.0  # Torque strength to return to upright position
@export var max_rotation_degrees: float = 180.0  # Maximum rotation limit
@export var force_strength: float = 500.0 # Strength of the force applied

func _process(delta: float) -> void:
	# Apply torque based on input
	if Input.is_action_pressed("ui_left"):  # Rotate left
		apply_torque_impulse(-torque_strength * delta)
	elif Input.is_action_pressed("ui_right"):  # Rotate right
		apply_torque_impulse(torque_strength * delta)
	else:
		# Return to upright position
		if rotation_degrees > 0:
			apply_torque_impulse(-return_torque * delta)
		elif rotation_degrees < 0:
			apply_torque_impulse(return_torque * delta)
			
	## Apply upward force
	if Input.is_action_pressed("ui_up"):
		# Calculate the upward direction relative to the rotation
		var upward_direction = Vector2.UP.rotated(rotation)
		# Apply the force in the upward direction
		apply_central_force(upward_direction * force_strength)

	# Clamp the rotation to stay within 0 and 180 degrees
	#if rotation_degrees < 0.0:
		#rotation_degrees = 0.0
		#angular_velocity = 0.0  # Stop excessive torque at the boundary
	#elif rotation_degrees > max_rotation_degrees:
		#rotation_degrees = max_rotation_degrees
		#angular_velocity = 0.0
