extends VBoxContainer
var alert = preload("res://scenes/alert.tscn")
@onready var gm=%gamemanger

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
func make_alert():
	add_child(alert.instantiate())
	
