extends Button
@onready var info=$"../Sprite2D6"
# Called when the node enters the scene tree for the first time.


func _on_button_down() -> void:
	info.visible=true
	print("pressed")

func _on_button_up() -> void:
	info.visible=false
	print("unpressed")
