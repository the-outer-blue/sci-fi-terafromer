extends Button
@onready var gm = %gamemanger

func _pressed():
	gm.increase_water(1)
	print(gm.water)
	print(gm.land)
