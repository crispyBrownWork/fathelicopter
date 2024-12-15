extends Node2D

signal end()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	reload_scnene()
	
func reload_scnene() -> void:
	if(Input.is_action_pressed("reset")):
		get_tree().reload_current_scene()
	pass
	
func _on_terrain_end() -> void:
	emit_signal("end")
	get_tree().reload_current_scene()
