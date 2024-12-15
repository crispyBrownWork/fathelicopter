extends Label

var time_elapsed := 0.0
# You don't really need this
var counter = 1
var is_stopped := false

func _process(delta: float) -> void:
	if !is_stopped:
		time_elapsed += delta
		text = "Timer: " + str(time_elapsed).pad_decimals(2)

func reset() -> void:
	# possibly save time_elapsed somewhere else before overriding it
	time_elapsed = 0.0
	is_stopped = false

func stop() -> void:
	is_stopped = true


func _on_world_environment_end() -> void:
	Global.check_time(time_elapsed)
