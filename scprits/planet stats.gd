extends RichTextLabel

@onready var game_manager = %gamemanger

#sets the value of the stats at text when called
func _process(delta: float) -> void:
	text = ("tempreture  "+str(game_manager.tempreture)
	+"\n"+"O2  "+str(round(game_manager.o2))
	+"\n"+"CO2  "+str(round(game_manager.co2))
	+"\n"+"money  "+str(game_manager.money)
	+"\n"+"plants  "+str(game_manager.plants)
	+"\n"+"animals "+str(game_manager.animals)
	+"\n"+"water "+str(game_manager.water))
	pass
