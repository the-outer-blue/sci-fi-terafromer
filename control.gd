extends Control
var alpha=0.0
@onready var gm=%gamemanger

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var text=$RichTextLabel
	if gm.talking_about_plants == true:
		text.text=gm.preason
	else:
		text.text=gm.areason
	$AnimationPlayer.play("alert spawn")

# Called every frame. 'delta' is the elapsed time since the previous frame.
