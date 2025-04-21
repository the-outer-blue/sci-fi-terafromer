extends RichTextLabel
var timer = 0
@onready var tm=%score_calculator

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	timer += 1*delta
		
	


func _on_score_calculator_tourist_visit() -> void:
	set_text("tourists result\n"+tm.temp_text+tm.plant_text+tm.animal_text+tm.o2_text+tm.co2_text+tm.air_text+"score="+str(tm.score))
