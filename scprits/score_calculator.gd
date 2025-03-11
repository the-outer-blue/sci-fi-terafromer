extends Node
var rng = RandomNumberGenerator.new()
@onready var gm = %gamemanger
var timer =0
var score = 0
var tourists=0
var ships = 0
var is_touring=false
var money_per_guest=50
func calculate_score():
	score=0
	if gm.tempreture >=40:
		score-=1
	elif gm.tempreture <=10:
		score-=1
	else:
		score+=1
	if gm.plants >= 30:
		score+=2
	elif gm.plants <= 5:
		score-=2
	elif gm.plant >=10:
		score+=1
	else:
		score-=1
	if gm.animals >= 20:
		score+=2
	elif gm.animals <= 5:
		score-=2
	elif gm.animals >= 10:
		score+=1
	else:
		score-=1
	var keep_animals=true
	if gm.o2 > 30:
		gm.keep_animals=false
	elif gm.o2 < 5:
		gm.keep_animals=false
	elif gm.co2 > 10:
		gm.keep_animals=false
	if gm.keep_animals==false:
		score-=3
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	timer += 1*delta
#calculates how many tourists come every 30 seconds
	if timer >= 30 and is_touring == false:
		calculate_score()
		is_touring= true
		tourists = round(rng.randi_range(0, 10))**(score+0.5)
		if tourists >ships:
			tourists-= tourists-ships
#give money based on amount of tourists
		gm.increase_money(tourists*money_per_guest)
		tourists=0
		is_touring = false
		timer=0
