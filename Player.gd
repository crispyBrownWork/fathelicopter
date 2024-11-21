extends Node2D

# Speed of rotation when the player presses keys
@export var rotation_speed: float = 100.0
# Speed of rotation to return to upright position
@export var return_speed: float = 200.0

func _process(delta: float) -> void:
	# Get input for rotation
	if Input.is_action_pressed("ui_left"):  # 'A' is bound to ui_left by default
		rotation_degrees -= rotation_speed * delta
	elif Input.is_action_pressed("ui_right"):  # 'D' is bound to ui_right by default
		rotation_degrees += rotation_speed * delta
	else:
		# Return to upright position (90 degrees)
		if rotation_degrees > 0:
			rotation_degrees -= return_speed * delta
		elif rotation_degrees < 0:
			rotation_degrees += return_speed * delta

	# Clamp the rotation between 0 and 180 degrees
	rotation_degrees = clamp(rotation_degrees, -90, 90)
