extends VBoxContainer
var alert = preload("res://scenes/alert.tscn")
@onready var gm=%gamemanger
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
func make_alert():
	add_child(alert.instantiate())


func _on_gamemanger_death() -> void:
	var preason=gm.preason
	var areason=gm.areason
	var talking_about_plants=gm.talking_about_plants
	var text=alert.instantiate()
	add_child(text)
	if talking_about_plants == true:
		text.text=gm.preason
	else:
		text.text=gm.areason
