extends RigidBody2D

signal collision_occurred(impact_force: float, collision_point: Vector2)

@export var torque_strength: float = 3000.0  # Strength of the rotational force
@export var return_torque: float = 250.0  # Torque strength to return to upright position
@export var max_rotation_degrees: float = 180.0  # Maximum rotation limit
@export var force_strength: float = 100000.0 # Strength of the force applied
@export var linear_drag: float = 0.01  # Linear drag coefficient (0-1)
@export var angular_drag: float = 0.01  # Angular drag coefficient (0-1)

# Physics processing
func _physics_process(delta: float) -> void:
	apply_drag()
	handle_torque(delta)
	return_to_upright(delta)
	handle_force(delta)

# Apply drag to linear and angular velocity
func apply_drag() -> void:
	linear_velocity = linear_velocity.lerp(Vector2.ZERO, linear_drag)
	angular_velocity = lerp(angular_velocity, 0.0, angular_drag)

# Handle torque inputs
func handle_torque(delta: float) -> void:
	if Input.is_action_pressed("ui_left"):  # Rotate left
		apply_torque_impulse(-torque_strength * delta)
	elif Input.is_action_pressed("ui_right"):  # Rotate right
		apply_torque_impulse(torque_strength * delta)

# Return to upright position
func return_to_upright(delta: float) -> void:
	if rotation_degrees > 0:
		apply_torque_impulse(-return_torque * delta)
	elif rotation_degrees < 0:
		apply_torque_impulse(return_torque * delta)

# Handle upward force
func handle_force(delta: float) -> void:
	if Input.is_action_pressed("ui_up"):
		var upward_direction = Vector2.UP.rotated(rotation)
		apply_central_force(upward_direction * force_strength * delta)

# Handle collision
func _on_body_entered(body: Node, collision: KinematicCollision2D) -> void:
	var impact_force = calculate_impact_force(body)
	emit_signal("collision_occurred", impact_force, global_position)

# Calculate impact force during collision
func calculate_impact_force(body: Node) -> float:
	var relative_velocity = linear_velocity
	if body is RigidBody2D:
		relative_velocity -= body.linear_velocity
	return mass * relative_velocity.length()
