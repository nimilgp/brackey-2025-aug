extends Node

var money = 10 
@onready var money_label: Label = $"money-label"

var time = 0
@onready var time_label: Label = $"time-label"

func add_money(amount):
	money += amount
	money_label.text = "$"+ str(money)

func reduce_money(amount):
	money -= amount
	money_label.text = "$"+ str(money)
	
func _process(delta: float) -> void:
	time += delta
	time_label.text = "Time:" + str(snappedf(time,0.01))
	if money <= 0:
		get_tree().quit()
		# end game
