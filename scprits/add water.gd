extends Button
@onready var gm = %gamemanger
@export var buttontype = 0
var button_text = ["tempreture","oxegen\n-100 money+1o2","carbon dioxide\n-100 money+1co2","plants\n-50 money +1plant\nmay die if planet is inhabittble","animals\n-50 money +1animal\nmay die if planet is inhabittble","water\n-10money +1%water"]
func _ready() -> void:
	text = ("add " + button_text[buttontype])
func _pressed():
	if buttontype == 0:
		gm.increase_temp(1)
		$"../../../sound_manager/button_press".play()
	elif buttontype == 1 and gm.money >= 100:
		gm.increase_o2(1)
		$"../../../sound_manager/button_press".play()
		gm.increase_money(-100)
	elif buttontype == 2 and gm.money >= 100:
		gm.increase_co2(1)
		gm.increase_money(-100)
		$"../../../sound_manager/button_press".play()
	elif buttontype == 3 and gm.money >= 50:
		gm.increase_plants(1)
		gm.increase_money(-50)
		$"../../../sound_manager/button_press".play()
	elif buttontype == 4 and gm.money >= 50:
		gm.increase_animals(1)
		gm.increase_money(-50)
		$"../../../sound_manager/button_press".play()
	elif buttontype == 5 and gm.money >= 10:
		gm.increase_water(1)
		gm.increase_money(-10)
		$"../../../sound_manager/button_press".play()
