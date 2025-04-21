extends RichTextLabel
@onready var tm=%score_calculator
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	text=("tourists in "+str(round(60-tm.timer))+
	"\n"+"ratings "+str(tm.score)+"/5"+
	"\n"+"guests "+str(tm.tourists))
