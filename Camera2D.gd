extends Camera2D

@export var target: NodePath  # Path to the target node (e.g., the player)

func _process(delta: float) -> void:
	if target:
		# Get the target's global position and set the camera's position
		var target_node = get_node(target)
		position = target_node.global_position
