extends Button
@onready var gm = %gamemanger
@export var buttontype = 0
var button_text = ["tempreture","oxegen","carbon dioxide","plants","animals","water"]
func _ready() -> void:
	text = ("add " + button_text[buttontype])
func _pressed():
	if buttontype == 0:
		gm.increase_temp(1)
	elif buttontype == 1 and gm.money >= 100:
		gm.increase_o2(1)
		gm.increase_money(-100)
	elif buttontype == 2 and gm.money >= 100:
		gm.increase_co2(1)
		gm.increase_money(-100)
	elif buttontype == 3 and gm.money >= 50:
		gm.increase_plants(1)
		gm.increase_money(-50)
	elif buttontype == 4 and gm.money >= 50:
		gm.increase_animals(1)
		gm.increase_money(-50)
	elif buttontype == 5 and gm.money >= 10:
		gm.increase_water(1)
		gm.increase_money(-10)
