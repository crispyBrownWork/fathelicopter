extends RigidBody2D

signal collision_occurred(impact_force: float, collision_point: Vector2)

@export var torque_strength: float = 3000.0  # Strength of the rotational force
@export var return_torque: float = 250.0  # Torque strength to return to upright position
@export var max_rotation_degrees: float = 180.0  # Maximum rotation limit
@export var force_strength: float = 100000.0 # Strength of the force applied
@export var linear_drag: float = 0.01  # Linear drag coefficient (0-1)
@export var angular_drag: float = 0.01  # Angular drag coefficient (0-1)

func _physics_process(delta: float) -> void:
	# Apply drag to linear velocity
	linear_velocity = linear_velocity.lerp(Vector2.ZERO, linear_drag)
	
	# Apply drag to angular velocity
	angular_velocity = lerp(angular_velocity, 0.0, angular_drag)
	
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
			
	# Apply upward force
	if Input.is_action_pressed("ui_up"):
		# Calculate the upward direction relative to the rotation
		var upward_direction = Vector2.UP.rotated(rotation)
		# Apply the force in the upward direction
		apply_central_force(upward_direction * force_strength * delta)
		
func _on_body_entered(body: Node, collision: KinematicCollision2D) -> void:
	# Calculate impact force using mass and velocity
	var relative_velocity = linear_velocity
	if body is RigidBody2D:
		relative_velocity = linear_velocity - body.linear_velocity
# F = ma, where 'a' is derived from the velocity change during collision
	var impact_force = mass * relative_velocity.length()
	
	emit_signal("collision_occurred", impact_force, global_position)
