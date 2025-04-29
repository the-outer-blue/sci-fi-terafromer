extends Button
@onready var gm = %gamemanger
@export var buttontype = 0
var black = Color(0.0,0.0,0.0,1.0)
var button_text = ["tempreture","o2\n-100 money+1o2","co2\n-100 money+1co2","plants\n-50 money+1plant","animals\n-50 money+1animal","water\n-10 money+1%water"]
func _ready() -> void:
	set("theme_override_colors/font_color",black)
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
