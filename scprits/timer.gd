extends RichTextLabel
@onready var tm=%score_calculator

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	text=("tourists in "+str(round(tm.time_till_tourist-tm.timer))+
	"\n"+"ratings "+str(tm.rating))
