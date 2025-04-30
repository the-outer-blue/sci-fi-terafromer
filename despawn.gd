extends RichTextLabel


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass





func _on_timer_timeout() -> void:
	queue_free()
