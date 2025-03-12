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

func calculate_score():
	score=0
	print("tourist results")
	if gm.tempreture >=40:
		score-=1
		print("temp too hiigh score -1")
	elif gm.tempreture <=10:
		score-=1
		print("temp too low score -1")
	else:
		score+=1
		print("temp good score +1")
	if gm.plants >= 30:
		score+=2
		print("lots of plants score +2")
	elif gm.plants <= 5:
		score-=2
		print("very few plants score -2")
	elif gm.plant >=10:
		score+=1
		print("good amount of plants score +1")
	else:
		score-=1
		print("few plants score-1")
	if gm.animals >= 20:
		score+=2
		print("lots of animals score +2")
	elif gm.animals <= 5:
		score-=2
		print("very few aniamls score -2")
	elif gm.animals >= 10:
		print("good amount of aniamals score +1")
		score+=1
	else:
		score-=1
		print("few animals score -1")
	breathable_air=true
	if gm.o2 > 30:
		breathable_air=false
		print("o2 too high")
	elif gm.o2 < 5:
		breathable_air=false
		print("o2 too low")
	elif gm.co2 > 10:
		print("co2 too high")
		breathable_air=false
	if breathable_air ==false:
		print("air unbreathable score -3")
		score-=3
	if score < 0 :
		score=0
	print("score="+str(score))

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	timer += 1*delta
#calculates how many tourists come every 30 seconds
	if timer >= time_till_tourist and is_touring == false:
		calculate_score()
		is_touring= true
		tourists = round(rng.randi_range(0, 10))**(score+0.5)
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
