extends Node
var tempreture = 0
var o2=0
var co2=0
var money=3000
var plants=0
var animals =0
var water=0
var land=100
var other_gases = 100
var o2persec=0
var co2persec=0
var max_gases=0

func increase_temp(amount):
	tempreture+=amount

func increase_o2(amount):
	o2+=amount

func increase_co2(amount):
	co2+=amount
	increase_temp(amount)

func increase_money(amount):
	money+=amount

func increase_plants(amount):
	plants+=amount
	o2persec+=amount*0.5
	co2persec-=amount*0.5

func increase_animals(amount):
	animals+=amount
	o2persec-=amount*0.5
	co2persec+=amount*0.5

func increase_land(amount):
		land+=amount
		water-=amount

func increase_water(amount):
	water+=amount
	land-=amount
#checks if the animals can survive and gets rid of them if not
func keep_animals_check():
	if animals > 0:
		var keep_animals=true
		if o2 > 30:
			print("o2 too high")
			keep_animals=false
		elif o2 < 5:
			print("o2 too low")
			keep_animals=false
		elif co2 > 10:
			print("co2 too high")
			keep_animals=false
		if keep_animals==false:
			increase_animals(-animals)
			print("animals wiped")
			$"../sound_manager/alert".play()
#checks if the plants can survive and gets rid of them if not
func keep_plants_check():
	if plants > 0:
		var keep_plants=true
		if co2 < 0:
			keep_plants=false
			print("co2 low")
		if tempreture > 60:
			keep_plants=false
			print("temp high")
		if tempreture < 5:
			keep_plants=false
			print("temp low")
		if plants > 0:
			if water/plants < 2:
				increase_plants(-(plants-(water/2)))
				print("plants kepts with water")
		if keep_plants == false:
			increase_plants(-plants)
			print ("plants wiped")
			$"../sound_manager/alert".play()

func _process(delta: float) -> void:
	o2 += o2persec*delta
	co2 += co2persec*delta
	keep_animals_check()
	keep_plants_check()
	
