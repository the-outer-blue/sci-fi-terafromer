extends RichTextLabel

@onready var game_manager = %gamemanger
# Called every frame. 'delta' is the elapsed time since the previous frame.
@warning_ignore("unused_parameter")
func _process(delta: float) -> void:
	text = ("tempreture  "+ str(game_manager.tempreture)
	+"\n"+"O2  "+str(game_manager.o2)
	+"\n"+"CO2  "+str(game_manager.co2)
	+"\n"+"money  "+str(game_manager.money)
	+"\n"+"plants  "+str(game_manager.animals)
	+"\n"+"O2  "+str(game_manager.animals))
	pass
