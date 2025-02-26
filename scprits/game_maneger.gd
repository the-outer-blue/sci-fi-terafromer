extends Node
var tempreture = 0
var o2=0
var co2=0
var money=0
var plants=0
var animals =0
var water=0
var land=0
func increase_temp(amount):
	tempreture+=amount
func increase_o2(amount):
	o2+=amount
func increase_co2(amount):
	co2+=amount
	#hello
func increase_money(amount):
	money+=amount
func increase_plants(amount):
	plants+=amount
func increase_animals(amount):
	animals+=amount
func increase_land(amount):
	land+=amount
	water-=amount
func increase_water(amount):
	water+=amount
	land-=amount
