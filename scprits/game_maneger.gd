extends Node
var gv="res://global_varibles.gd"
var tempreture = 0
var o2=0
var co2=0
var money=5000
var plants=0.0
var animals =0.0
var water=0
var land=100
var other_gases = 100
var o2persec=0
var co2persec=0
var max_gases=0
var areason=" "
var preason=" "
var talking_about_plants=false
signal death
signal remove_o2
@onready var quit=$"../bailout"

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
	talking_about_plants=false
	if animals > 0:
		var keep_animals=true
		if o2 > 30:
			areason=("o2 too high")
			keep_animals=false
		elif o2 < 5:
			areason=("o2 too low")
			keep_animals=false
		elif co2 > 10:
			areason=("co2 too high")
			keep_animals=false
		if keep_animals==false:
			increase_animals(-ceili(animals/2))
			areason=(areason+"\nanimals dying")
			death.emit()
			$"../sound_manager/alert".play()
#checks if the plants can survive and gets rid of them if not
func keep_plants_check():
	talking_about_plants=true
	if plants > 0:
		var keep_plants=true
		if co2 < 0:
			keep_plants=false
			preason=("co2 low")
		if tempreture > 60:
			keep_plants=false
			preason=("temp high")
		if tempreture < 5:
			keep_plants=false
			preason=("temp low")
		if plants > 0:
			if water/plants < 2:
				increase_plants(-(plants-(water/2)))
				preason=("water too low")
				keep_plants=false
		if keep_plants == false:
			increase_plants(-ceili(plants/2))
			preason=(preason+"\nplants dying")
			death.emit()
			$"../sound_manager/alert".play()
		
func _on_timer_timeout() -> void:
	areason=""
	preason=""
	keep_animals_check()
	keep_plants_check()
	o2 += ceili(o2persec)
	co2 += ceili(co2persec)
	if co2 <= 0:
		co2=0
	if o2 <= 0:
		o2=0
	if o2 >30:
		remove_o2.emit(true)
	if o2 <30:
		remove_o2.emit(false)
	if money < 100:
		quit.visible=true
