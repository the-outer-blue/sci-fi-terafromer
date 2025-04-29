extends Button
@onready var info=$"../Sprite2D6"
# Called when the node enters the scene tree for the first time.


func _pressed() -> void:
	info.visible=not info.visible
