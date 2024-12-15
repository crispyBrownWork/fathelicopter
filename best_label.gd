extends Label


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	text = "Best:" + str(Global.best_time).pad_decimals(2)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_world_environment_end() -> void:
	pass # Replace with function body.
