extends RichTextLabel

@onready var game_manager = %gamemanger
#sets the value of the stats at text when called
func update_stats():
	text = ("tempreture  "+ str(game_manager.tempreture)
	+"\n"+"O2  "+str(game_manager.o2)
	+"\n"+"CO2  "+str(game_manager.co2)
	+"\n"+"money  "+str(game_manager.money)
	+"\n"+"plants  "+str(game_manager.animals)
	+"\n"+"O2  "+str(game_manager.animals))
	pass
