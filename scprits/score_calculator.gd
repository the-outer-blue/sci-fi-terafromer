extends Node
var rng = RandomNumberGenerator.new()
@onready var gm = %gamemanger
var timer =0
var score = 0
var tourists=0
var ships = 0
var is_touring=false
var money_per_guest=50
var breathable_air=false
const time_till_tourist = 60
signal tourist_visit
var temp_text=""
var plant_text=""
var animal_text=""
var o2_text=""
var co2_text=""
var air_text=""
func calculate_score():
	score=0
	print("tourist results")
	if gm.tempreture >=50:
		score-=1
		temp_text=("temp too hiigh score -1 remove co2 for lower temps\n")
	elif gm.tempreture <=10:
		score-=1
		temp_text=("temp too low score -1 add co2 to increase temps\n")
	else:
		score+=1
		temp_text=("temp good score +1\n")
	if gm.plants >= 15:
		score+=2
		plant_text=("lots of plants score +2\n")
	elif gm.plants <=0:
		score-=2
		plant_text=("no plants score -2\n")
	elif gm.plant >=10:
		score+=1
		plant_text=("good amount of plants score +1\n")
	else:
		score-=1
		plant_text=("few plants score-1\n")
	if gm.animals >= 15:
		score+=2
		animal_text=("lots of animals score +2\n")
	elif gm.animals <= 0:
		score-=2
		animal_text=("no aniamls score -2\n")
	elif gm.animals >= 10:
		animal_text=("good amount of aniamals score +1\n")
		score+=1
	else:
		score-=1
		animal_text=("few animals score -1\n")
	breathable_air=true
	if gm.o2 > 30:
		breathable_air=false
		o2_text=("o2 too high\n")
	elif gm.o2 < 5:
		breathable_air=false
		o2_text=("o2 too low buy plants for more o2\n")
	elif gm.co2 > 10:
		co2_text=("co2 too high buy plants to decrease co2\n")
		breathable_air=false
	if breathable_air ==false:
		air_text=("air unbreathable score -3\n")
		score-=3
	if score < 0 :
		score=0
	tourist_visit.emit

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	timer += 1*delta
#calculates how many tourists come every 30 seconds
	if timer >= time_till_tourist and is_touring == false:
		$"../sound_manager/notification".play()
		calculate_score()
		is_touring= true
		tourists = score*1000
		if tourists >ships:
			tourists-= tourists-ships
		emit_signal("tourist_visit")
#give money based on amount of tourists
		if tourists > 0:
			gm.increase_money(tourists*money_per_guest)
		else:
			tourists=0
		is_touring = false
		timer=0
